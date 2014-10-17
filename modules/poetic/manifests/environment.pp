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

  package { git-flow:
    ensure => present
  }

  package { chromedriver:
    ensure => present
  }
}
