class poetic::environment {
  include stdlib
  include homebrew
  include chrome
  include firefox
  include googledrive
  include imageoptim
  include postgresql
  include sourcetree
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
  include tmux
  include ctags
  include mongodb
  include iterm2::stable
  include iterm2::colors::solarized_dark
  include mysql
  include osx::global::disable_key_press_and_hold
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::dock::autohide
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::universal_access::ctrl_mod_zoom
  include osx::universal_access::enable_scrollwheel_zoom
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::keyboard::capslock_to_control
  include macvim

  class { 'osx::global::key_repeat_delay':
    delay => 15
  }

  class { 'osx::global::key_repeat_rate':
    rate => 2
  }

  iterm2::colors { 'Cobalt by Jake':
    ansi_0_color        => [0.0, 0.15575926005840302, 0.19370138645172119],
    ansi_1_color        => [0.85453194379806519, 0.22711621224880219, 0.07502446323633194],
    ansi_2_color        => [0.23722761869430542, 0.88532239198684692, 0.48532426357269287],
    ansi_3_color        => [0.64746475219726562, 0.46751424670219421, 0.023484811186790466],
    ansi_4_color        => [0.12754884362220764, 0.46265947818756104, 0.78231418132781982],
    ansi_5_color        => [0.77738940715789795, 0.10802463442087173, 0.43516635894775391],
    ansi_6_color        => [0.98226630687713623, 0.81526660919189453, 0.043792862445116043],
    ansi_7_color        => [0.91611063480377197, 0.89001238346099854, 0.79781103134155273],
    ansi_8_color        => [0.0, 0.11783610284328461, 0.15170273184776306],
    ansi_9_color        => [0.74176257848739624, 0.21325300633907318, 0.073530435562133789],
    ansi_10_color       => [0.27671992778778076, 0.35665956139564514, 0.38298487663269043],
    ansi_11_color       => [0.32436618208885193, 0.40717673301696777, 0.43850564956665039],
    ansi_12_color       => [0.44058024883270264, 0.50962930917739868, 0.51685798168182373],
    ansi_13_color       => [0.34798634052276611, 0.33896297216415405, 0.72908437252044678],
    ansi_14_color       => [0.50599193572998047, 0.56485837697982788, 0.56363654136657715],
    ansi_15_color       => [0.98943418264389038, 0.95794391632080078, 0.86405980587005615],
    background_color    => [0.078611709177494049, 0.2130102664232254, 0.39043867588043213],
    bold_color          => [0.50599193572998047, 0.56485837697982788, 0.56363654136657715],
    cursor_color        => [0.44058024883270264, 0.50962930917739868, 0.51685798168182373],
    cursor_text_color   => [0.0, 0.15575926005840302, 0.19370138645172119],
    foreground_color    => [0.74780541658401489, 0.83548241853713989, 1],
    selected_text_color => [0.50599193572998047, 0.56485837697982788, 0.56363654136657715],
    selection_color     => [0.0, 0.15575926005840302, 0.19370138645172119]
  }

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
    ensure => present
  }

  package { cmake:
    ensure => present
  }

  # Vundle install
  exec { 'vim +PluginInstall! +qall':
  }

  exec { 'vim +PluginClean! +qall':
  }

  # TPM install
  exec { 'tmux new -s tpm_install -d; ~/.tmux/plugins/tpm/scripts/install_plugins.sh; tmux kill-session -t tpm_install': }
}
