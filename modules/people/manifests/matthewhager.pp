class people::matthewhager {
  $home         = "/Users/${::luser}"
  $development  = "${home}/Development"
  $dotfiles     = "${development}/dotfiles"

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
    source  => 'git@bitbucket.org:MatthewHager/dotfiles.git',
    require => File[$dotfiles]
  }

  file { "${home}/.profile":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/profile",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.gitconfig.local":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/gitconfig",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/aegirvps":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/aegirvps",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/aegirvps.pub":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/aegirvps.pub",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/bitbucket":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/bitbucket",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/bitbucket.pub":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/bitbucket.pub",
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

  file { "${home}/.ssh/koumbit.pem":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/koumbit.pem",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/poeticsystems":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/poeticsystems",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/poeticsystems.pub":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/poeticsystems.pub",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/weathervane":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/weathervane",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.ssh/weathervane.pub":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/weathervane.pub",
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
}
