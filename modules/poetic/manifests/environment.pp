class poetic::environment {
  include stdlib
  include homebrew
  include chrome
  include firefox
  include googledrive
  include imageoptim
  include postgresql
  include sourcetree
  include spotify
  include sublime
  include transmit
  include vagrant
  include virtualbox
  include wget
  include sourcetree
  include heroku
  include memcached
  include java
  include solr
  include elasticsearch
  include eclipse::java
  include android::sdk
  include macvim
  include tmux
  include ctags
  include mongodb
  include iterm2::stable
  include iterm2::colors::solarized_dark
  include mysql

  $ruby_version = '2.1.1'

  class { 'ruby::global': version => $ruby_version }

  ruby_gem { "rails for ${version}":
    gem     => 'rails',
    ruby_version    => $ruby_version
  }

  ruby_gem { "ruboto for ${version}":
    gem     => 'ruboto',
    ruby_version    => $ruby_version
  }

  ruby_gem { "rails-api for ${version}":
    gem     => 'rails-api',
    ruby_version    => $ruby_version
  }

  ruby_gem { "compass for ${version}":
    gem     => 'compass',
    ruby_version    => $ruby_version
  }

  ruby_gem { "tmuxinator for ${version}":
    gem     => 'tmuxinator',
    ruby_version    => $ruby_version
  }

  ruby_gem { "rails_apps_composer for ${version}":
    gem     => 'rails_apps_composer',
    ruby_version    => $ruby_version
  }

  # legacy compass site support
  ruby_gem { "html5-boilerplate for ${version}":
    gem     => 'html5-boilerplate',
    ruby_version    => $ruby_version,
    version => '= 1.0.0'
  }

  android::version { '17':
    options => ['platform', 'add_on', 'system_image', 'sample']
  }

  package { drush:
    ensure => present
  }

  package { phantomjs:
    ensure => present
  }

  package { the_silver_searcher:
    ensure => present
  }

  package { git-flow:
    ensure => present
  }

  package { irssi:
    ensure => present
  }

  package { chromedriver:
    ensure => present
  }

  # set default node version
  $node_version = 'v0.10.26'
  class { 'nodejs::global': version => $node_version }

  # install some npm modules
  nodejs::module { 'meteorite':
    node_version => $node_version
  }

  nodejs::module { 'grunt-cli':
    node_version => $node_version
  }

  nodejs::module { 'bower':
    node_version => $node_version
  }

  nodejs::module { 'cordova':
    node_version => $node_version
  }

  nodejs::module { 'ember-cli':
    node_version => $node_version
  }

  nodejs::module { 'yo':
    node_version => $node_version
  }

  ##########################
  # Dotfile Config
  #########################
  $home            = "/Users/${::luser}"
  $poetic_dotfiles = "${home}/.poetic_dotfiles"

  file { $poetic_dotfiles:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  repository { $poetic_dotfiles:
    source  => 'https://github.com/poetic/dotfiles.git',
    ensure  => 'origin/master',
    require => File[$poetic_dotfiles]
  }

  # Symlinks
  file { "${home}/.vim":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/vim",
  }

  file { "${home}/.vimrc":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/vimrc",
    require => Repository["${poetic_dotfiles}"],
  }

  file { "${home}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/zshrc",
    require => Repository["${poetic_dotfiles}"],
  }

  file { "${home}/.oh-my-zsh":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/oh-my-zsh",
    require => Repository["${poetic_dotfiles}"],
  }

  # Change shell to zsh
  osx_chsh { $::luser:
    shell   => '/bin/zsh',
  }

  file { "${home}/.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/tmux.conf",
    require => Repository["${poetic_dotfiles}"],
  }

  file { "${home}/.gitconfig":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/gitconfig",
    require => Repository["${poetic_dotfiles}"],
  }

  file { "${home}/.gitignore":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/gitignore",
    require => Repository["${poetic_dotfiles}"],
  }

  file { "${home}/.rspec":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/rspec",
    require => Repository["${poetic_dotfiles}"],
  }

  file { "${home}/.aliases":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/aliases",
    require => Repository["${poetic_dotfiles}"],
  }

  file { "${home}/.vimrc.bundles":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/vimrc.bundles",
    require => Repository["${poetic_dotfiles}"],
  }

  file { "${home}/.ctags":
    ensure  => link,
    mode    => '0644',
    target  => "${poetic_dotfiles}/ctags",
    require => Repository["${poetic_dotfiles}"],
  }

  # used to make tmux copy/paste work
  package { reattach-to-user-namespace:
    ensure => present
  }

  package { autojump:
    ensure   => present
  }

}
