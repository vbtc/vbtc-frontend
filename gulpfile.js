const fs = require('fs');
const gulp = require('gulp');
const deploy = require('gulp-gh-pages');
const exec = require("child_process").exec;
const replace = require('gulp-replace-task');
const git = require('git-rev-sync');
const prompt = require('gulp-prompt');
const yaml = require('js-yaml');
let branch = 'gh-pages';

let newUrl = '';
let newBaseUrl = '';

const URL_MSG = "Your Domain: \n\nThe name of your domain."+
    "\ne.g.:\nhttps://username.github.io or https://myexchange.com \n\ndefault: ";

const BASEURL_MSG = "Your Base URL: \n\nYou can choose a base url followed by your domain:"+
    "\ne.g.:\n/mybaseurl \n\nOr Just: `/`\n\nIt will result as"+
    " https://myexchange.com/mybaseurl \n\ndefault: ";

const BRANCH_MSG = "Github Branch: \n\n"+
    "If your using your repository as `organization.github.io` you should use the `master` branch,\n"+
    "otherwise, `gh-pages` branch."+
    "\n\nSee more at: https://help.github.com/articles/user-organization-and-project-pages/"+
    "\n\nChoose: ";

function resolve(from, to) {
    const resolvedUrl = new URL(to, new URL(from, 'resolve://'));
    if (resolvedUrl.protocol === 'resolve:') {
        // `from` is a relative URL.
        const { pathname, search, hash } = resolvedUrl;
        return pathname + search + hash;
    }
    return resolvedUrl.toString();
}

gulp.task('build', function(done){
    console.log('Building...');
    exec('bundle exec jekyll build', function(err, stdout, stderr){
        if(err) {
            done(err);
        }
        console.log(stdout);
        console.log(stderr);
        done();
    });
});

gulp.task('config', function(done){
    const rev = git.short();
    const config = yaml.load(fs.readFileSync('./_config.yml'));

    // noinspection JSUnresolvedVariable
    if(config.baseurl === undefined) {
        return done(new Error('Baseurl not defined'));
    }

    //const baseUrl = config.baseurl;

    return gulp.src('_config.yml')
        .pipe(prompt.prompt({
            type: 'input',
            name: 'url',
            message: URL_MSG,
            default: config.url
        }, function(res){
            newUrl = res.url;
            newUrl = newUrl.startsWith('http') ?
                newUrl                :
                'http://' + newUrl;
        }))
        .pipe(prompt.prompt({
            type: 'input',
            name: 'baseurl',
            message: BASEURL_MSG
        }, function(res){
            // noinspection JSUnresolvedVariable
            newBaseUrl = res.baseurl.charAt(0) === '/' || res.baseurl === "" ? res.baseurl : '/' + res.baseurl;
        }))
        .pipe(prompt.prompt({
            type: 'list',
            name: 'branch',
            message: BRANCH_MSG,
            choices: ['master', 'gh-pages']
        }, function(res){
            console.log('Git Rev : ' + rev);
            console.log('Branch  : ' + res.branch);
            console.log('BaseUrl : ' + newBaseUrl);

            branch = res.branch;
        }))
        .pipe(replace({
            usePrefix: false,
            patterns: [
                {
                    match: /^deploy_version:.*$/m,
                    replacement: function(){
                        return 'deploy_version: "'+rev+'"';
                    }
                }, {
                    match: /^url:.*$/m,
                    replacement: function(){
                        return 'url: "'+newUrl+'"';
                    }
                }, {
                    match: /^baseurl:.*$/m,
                    replacement: function(){
                        return 'baseurl: "'+newBaseUrl+'"';
                    }
                }
            ]
        }))
        .pipe(gulp.dest('./'));
});

gulp.task('deployBranch', function(done){
    console.log('Deploying...');
    return gulp.src("./_site/**/*")
        .pipe(deploy({ branch: branch }));
});

gulp.task('deploy', gulp.series('config', 'build', 'deployBranch', function(){
        console.log('\nOpen your browser at: '+ resolve(newUrl, newBaseUrl));
        console.log('Done');
    })
);

gulp.task('default', function(cb) {
    // body omitted
    cb();
});
