class people::joeleon {
  include spotify

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
    source  => 'git@bitbucket.org:joseph_leon/dotfiles.git',
    require => File[$dotfiles]
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

  file { "${home}/.ssh/poeticsystems":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/poeticsystems",
    require => Repository["${dotfiles}"],
  }

}
