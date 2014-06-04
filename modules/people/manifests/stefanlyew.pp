class people::stefanlyew {
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
    source  => 'git@bitbucket.org:findaway/base_boxen_dotfiles.git',
    require => File[$dotfiles]
  }

  file { "${home}/.aliases.local":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/aliases.local",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.vimrc.local":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/vimrc.local",
    require => Repository["${dotfiles}"],
  }

  file { "${home}/.vimrc.bundles.local":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles}/vimrc.bundles.local",
    require => Repository["${dotfiles}"],
  }

  package { cmake:
    provider => homebrew,
    require  => Exec['tap-homebrew-versions'],
  }
}
