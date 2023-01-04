# Blinktrade Bitcoin Exchange

## Technologies we are using
- [jekyll](http://jekyllrb.com/), a static generator in Ruby, to create the static html pages
- [google closure library](https://developers.google.com/closure/library/) for the javascript application 
- [google closure templates](https://developers.google.com/closure/templates/) for some of the javascript ui views


## Install prerequisites
**Install [Git](http://git-scm.com/downloads), [Ruby](https://www.ruby-lang.org/pt/downloads/), [Bundler](https://bundler.io/) and [Java](https://java.com/download/index.jsp), in case you don't have them yet.**

* Git any version
* Java 11
* Ruby 2.7.4
* Bundler 2.1.4

Ruby Gems (see `Gemfile`)
* jekyll 3.9.2
* jekyll-multiple-languages-plugin 1.8.0
* github-pages 227

Ruby and Bundler are preferably managed by [rbenv](https://github.com/rbenv/rbenv).

**Install required ruby gems**
```sh
$ bundler install
```


## Build & deploy using helper scripts

**Build javascript**
```sh
$ ./build_javascript.sh
```

**Build and deploy mainnet to GitHub Pages**
```sh
$ build_and_deploy_mainnet.sh
```

## Manual build & deploy

### 1. Build the JavaScript application

_Only needed in case you changed the `./jsdev` application._

#### Compile all Javascript

It will compile for all themes and languages.

```sh
./build_javascript.sh
```

#### Compile a specific theme or language
The defaults are US english (en_US) and the default theme ('default'), but can be overridden.
To build the british english version with a custom theme:

```sh
$ cd ./jsdev 
$ THEME=custom sh build_templates.sh
$ LANG=en_US THEME=custom sh build_js.sh
```


### 2A. Run the exchange locally 
1. Fork the repo

2. Rename it to `exchange` or any name you wish.  Let's use exchange for this example

3. clone your new repo 
```sh
$ git clone https://github.com/yourgithubusername/exchange
$ cd exchange
```
4. Create a symbolic link to some `_config.foxbit.yml` files
```sh
$ ln -s _config.demo.yml _config.yml
```
5. And finally run:
```sh
$ bundle exec jekyll server --watch
```

You'll have access to the website at `localhost:4000`

### 2B. Deploy the exchange to [GitHub Pages](https://pages.github.com/)

Build the static site with Jekyll

```sh
mkdir -p _site_mainnet
git clone --depth 1 --single-branch --branch gh-pages git@github.com:vbtc/vbtc.github.io.git _site_mainnet
bundle exec jekyll build --config _config.yml,_config.vbtc.mainnet.yml
```
Deploy to GitHub Pages

```sh
cd _site_mainnet
git add .
git commit "Deploying next version"
git push
```

## File Structure

### [_includes](https://github.com/vbtc/vbtc-frontend/tree/master/_includes)

They're blocks of code used to generate the main page of the site (index.html).

### [_layouts](https://github.com/vbtc/vbtc-frontend/tree/master/_layouts)

Here you'll find the default template of the application.

### [_posts](https://github.com/vbtc/vbtc-frontend/tree/master/_posts)

Here you'll find a list of files for each post.

### [_config.yml](https://github.com/vbtc/vbtc-frontend/tree/master/_config.yml)

It stores most of the settings of the application.

### [index.html](https://github.com/vbtc/vbtc-frontend/tree/master/index.html)

The static html page 

### [jsdev](https://github.com/vbtc/vbtc-frontend/tree/master/jsdev)

The google closure javascript application

### [assets](https://github.com/vbtc/vbtc-frontend/tree/master/assets)

Images, CSS, Compiled JavaScripts, Fonts and all static content.

## Credits
The exchange was originally built by Blinktrade, Inc.

From the start of 2023 BitcoinVN took over and restarted active development.

## License
[GNU GENERAL PUBLIC LICENSE](https://github.com/vbtc/vbtc-frontend/blob/master/LICENSE) © Blinktrade, Inc.
