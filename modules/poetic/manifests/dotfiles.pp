class poetic::dotfiles {
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

  # update package managers (vim, tpm)
  exec { 'vim +PluginInstall! +qall':
    refreshonly => true,
    subscribe   => Repository[$poetic_dotfiles]
  }

  exec { 'vim +PluginClean! +qall':
    refreshonly => true,
    subscribe   => Repository[$poetic_dotfiles]
  }

  exec { 'tmux new -s tpm_install -d; ~/.tmux/plugins/tpm/scripts/install_plugins.sh; tmux kill-session -t tpm_install':
    refreshonly => true,
    subscribe   => Repository[$poetic_dotfiles]
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
}
