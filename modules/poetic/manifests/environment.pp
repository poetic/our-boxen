class poetic::environment {
  include chrome
  include firefox
  include googledrive
  include dropbox
  include sourcetree
  include sublime_text
  include virtualbox
  include vagrant
  include wget
  include tmux
  include ctags
  include iterm2::stable
  include iterm2::colors::solarized_dark

  include osx::global::disable_key_press_and_hold
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::universal_access::ctrl_mod_zoom
  include osx::universal_access::enable_scrollwheel_zoom
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::keyboard::capslock_to_control

  class { 'osx::global::key_repeat_delay': delay => 15 }
  class { 'osx::global::key_repeat_rate': rate => 2 }


  # change shell to zsh

  osx_chsh { $::luser:
    shell   => '/bin/zsh',
  }


  # ruby configuration

  $ruby_version = '2.1.2'
  class { 'ruby::global': version => $ruby_version }


  # node config

  $node_version = 'v0.10.31'
  class { 'nodejs::global': version => $node_version }


  # command line dev environment

  package { the_silver_searcher:
    ensure => present
  }

  package { reattach-to-user-namespace:
    ensure => present
  }

  package { autojump:
    ensure => present
  }

  package { cmake:
    ensure => present
  }

  package { git-flow:
    ensure => present
  }

  package { chromedriver:
    ensure => present
  }


  # dot file config
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

  file { "Monaco for Powerline.otf":
    ensure => present,
    path   => "/Users/${::luser}/Library/Fonts/Monaco for Powerline.otf",
    source => "puppet:///modules/poetic/Monaco for Powerline.otf"
  }

  # update package managers (vim, tpm)
  exec { 'vim +PluginInstall! +qall': }
  exec { 'vim +PluginClean! +qall': }
  exec { 'tmux new -s tpm_install -d; ~/.tmux/plugins/tpm/scripts/install_plugins.sh; tmux kill-session -t tpm_install': }
}
