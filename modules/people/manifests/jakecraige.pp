class people::jakecraige {
  $home         = "/Users/${::luser}"
  $development  = "${home}/Development"
  $dotfiles     = "${development}/dotfiles"

  include dropbox
  include evernote
  include skitch
  include kindle

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
    source  => 'git@bitbucket.org:jakecraige/dotfiles.git',
    require => File[$dotfiles]
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

  file { "${home}/.ssh/poetic":
    ensure  => link,
    mode    => '0600',
    target  => "${dotfiles}/ssh/poetic",
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
    ensure   => present
  }

  package { couchdb: # used for hoodie-cli
    ensure   => present
  }

  $node_version = 'v0.10.26'

  nodejs::module { 'hoodie-cli':
    node_version => $node_version
  }
}
