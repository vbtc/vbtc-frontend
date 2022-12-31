# Blinktrade Bitcoin Exchange

## Technologies we are using
- [jekyll](http://jekyllrb.com/), a static generator in Ruby, to create the static html pages
- [google closure library](https://developers.google.com/closure/library/) for the javascript application 
- [google closure templates](https://developers.google.com/closure/templates/) for some of the javascript ui views

## A. Install pre-requesites 
1. Install [Git](http://git-scm.com/downloads), [Ruby](https://www.ruby-lang.org/pt/downloads/) anda [Java](https://java.com/download/index.jsp), in case you don't have them yet.


2. Once installed these dependencies, open up the terminal and install [Jekyll](http://jekyllrb.com) with the following commands.

```sh
$ gem install jekyll:2.5.3
```

3. Install jekyll multiple languages plugin
```sh
$ gem install jekyll-multiple-languages-plugin:1.2.9
```


## B. Build the JavaScript application

_Only needed in case you changed the `./jsdev` application._

#### Compile all Javascript

It will compile for all themes and languages.

```sh
./build_javascript.sh
```

#### Compile a specific theme or language
The defaults are US english (en_US) and the default theme ('default'), but can be overriden.
To build the british english version with a custom theme:

```sh
$ cd ./jsdev 
$ THEME=custom sh build_templates.sh
$ LANG=en_US THEME=custom sh build_js.sh
```


## C1 Run the exchange locally 
1 - Fork the repo

2 - Rename it to `exchange` or any name you wish.  Let's use exchange for this example

3 - clone your new repo 
```sh
$ git clone https://github.com/yourgithubusername/exchange
$ cd exchange
```
4 - Create a symbolic link to some `_config.foxbit.yml` files
```sh
$ ln -s _config.demo.yml _config.yml
```
5 - And finally run:
```sh
$ bundle exec jekyll server --watch
```

You'll have access to the website at `localhost:4000`

## C2 Deploy the exchange to [GitHub Pages](https://pages.github.com/)

Build the static site with Jekyll

```sh
bundle exec jekyll build
```

Run the `push_ghpages.sh` script

```sh
./push_ghpages.sh
```

## File Structure

The file structure for the project is organized in the following way:

```
.
|-- _includes
|-- _layouts
|-- _posts
|-- _config.yml
|-- jsdev
  |-- bitex
  |-- closure-bootstrap
  |-- closure-library
  |-- externs
  |-- scottlogic/chart
  |-- tools
  |-- translations
  |-- uniform
  |-- build_release.sh
|-- themes
  |-- default
  |-- ander
|-- assets
|-- index.html
```

### [_includes](https://github.com/blinktrade/frontend/tree/master/_includes)

They're blocks of code used to generate the main page of the site (index.html).

### [_layouts](https://github.com/blinktrade/frontend/tree/master/_layouts)

Here you'll find the default template of the application.

### [_posts](https://github.com/blinktrade/frontend/tree/master/_posts)

Here you'll find a list of files for each post.

### [_config.yml](https://github.com/blinktrade/frontend/tree/master/_config.yml)

It stores most of the settings of the application.

### [index.html](https://github.com/blinktrade/frontend/tree/master/index.html)

The static html page 

### [jsdev](https://github.com/blinktrade/frontend/tree/master/jsdev)

The google closure javascript application

### [assets](https://github.com/blinktrade/frontend/tree/master/assets)

Images, CSS, Compiled Javascripts, Fonts and all static content.


## License
[GNU GENERAL PUBLIC LICENSE](https://github.com/blinktrade/frontend/blob/master/LICENSE) © Blinktrade, Inc.
