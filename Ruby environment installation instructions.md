# Ruby:

## Setting up the development environment:

Arch Linux

Install system version of ruby
`pacman -S rubygems`

Install rbenv and its plugin ruby-build

`trizen -S rbenv ruby-build`

Set up rbenv init by adding the following line in:
~/.zshrc
~/.bashrc
~/.bash_profile


```
# Set up rbenv Ruby environment management
eval "$(rbenv init - bash)"
```

Install specific ruby versions:

`rbenv install 3.1.3`

Set that version as the local version of ruby

`rbenv local 3.1.3`



## Install Jekyll

Set up vendoring of gems (install them to a folder in the project directory):
`bundle config path 'vendor/bundle' --local`


Initiate a new Gemfile
`bundle init`


Add these lines

```
gem 'jekyll' '4.3.1'
gem 'jekyll-multiple-languages-plugin' '1.7.0'

```


Run lock and install

`bundle lock`
`bundle install`


From now on run jekyll through `bundle exec jekyll`

