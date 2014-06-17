############################
# Change githubusername to your gh username
###########################
class people::githubusername {
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
    ############################
    # Change bitbucketusername to your username
    ###########################
    source  => 'git@bitbucket.org:bitbucketusername/dotfiles.git',
    require => File[$dotfiles]
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

}
