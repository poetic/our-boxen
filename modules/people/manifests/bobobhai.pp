class people::bobobhai {
  $home         = "/Users/${::luser}"
  $development  = "${home}/Development"
  $dotfiles     = "${development}/dotfiles"

  include macvim
  include alfred
  include toggl
  include iterm2::stable
  include synergy
  include tmux
  include dropbox
  include evernote
  include ctags
  include skitch
  include spotify

  file { $development:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  file { $dotfiles:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  repository { $dotfiles:
    source  => 'git@bitbucket.org:bobobhai/dotfiles.git',
    require => File[$dotfiles]
  }

  file { "${home}/.vim":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/vim",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.vimrc":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/vimrc",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.gitconfig":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/gitconfig",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.gitignore":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/gitignore",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/id_rsa":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/id_rsa",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/id_rsa.pub":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/id_rsa.pub",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/poeticsystems":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/poeticsystems",
    require => Repository["${dotfiles}"],
  }
  file { "${home}/.bash_profile":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/bash_profile",
    require => Repository["${dotfiles}"],
  }
  file { "${home}/.bashrc":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/bashrc",
    require => Repository["${dotfiles}"],
  }
  file { "${home}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/zshrc",
    require => Repository["${dotfiles}"],
  }
  file { "${home}/.oh-my-zsh":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/oh-my-zsh",
    require => Repository["${dotfiles}"],
  }
  file { "${home}/.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/tmux.conf",
    require => Repository["${dotfiles}"],
  }



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

  property_list_key { 'Top Left Hotcorner - Start Screen Saver':
    ensure     => present,
    path       => "${home}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-tl-corner',
    value      => 5,
    value_type => 'integer',
    notify     => Exec['killall Dock'],
  }

  property_list_key { 'Top Left Hotcorner - Start Screen Saver - modifier':
    ensure     => present,
    path       => "${home}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-tl-modifier',
    value      => 0,
    value_type => 'integer',
    notify     => Exec['killall Dock'],
  }

  property_list_key { 'Top Right Hotcorner - Desktop':
    ensure     => present,
    path       => "${home}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-tr-corner',
    value      => 4,
    value_type => 'integer',
    notify     => Exec['killall Dock'],
  }

  property_list_key { 'Top Right Hotcorner - Desktop - modifier':
    ensure     => present,
    path       => "${home}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-tr-modifier',
    value      => 0,
    value_type => 'integer',
    notify     => Exec['killall Dock'],
  }

  file { "${home}/Library/Preferences/com.apple.dock.plist":
    ensure => file,
    require => [
                 Property_list_key['Top Left Hotcorner - Start Screen Saver'],
                 Property_list_key['Top Left Hotcorner - Start Screen Saver - modifier'],
                 Property_list_key['Top Right Hotcorner - Desktop'],
                 Property_list_key['Top Right Hotcorner - Desktop - modifier'],
               ],
    owner => $::luser,
    group => "staff"
  }
}
