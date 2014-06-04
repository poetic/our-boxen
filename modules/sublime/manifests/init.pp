class sublime {
  include sublime_text_2

  sublime_text_2::package { 'Package Control':
    source => 'wbond/sublime_package_control'
  }

  sublime_text_2::package { 'Theme - Soda':
    source => 'buymeasoda/soda-theme'
  }

  sublime_text_2::package { 'SublimeLinter':
    source => 'SublimeLinter/SublimeLinter'
  }

  sublime_text_2::package { 'HTML5':
    source => 'mrmartineau/HTML5'
  }

  sublime_text_2::package { 'jQuery':
    source => 'SublimeText/jQuery'
  }

  sublime_text_2::package { 'SASS':
    source => 'nathos/sass-textmate-bundle'
  }

  sublime_text_2::package { 'DocBlockr':
    source => 'spadgos/sublime-jsdocs'
  }

  sublime_text_2::package { 'SublimePuppet':
    source => 'russCloak/SublimePuppet'
  }

  sublime_text_2::package { 'Cucumber':
    source => 'drewda/cucumber-sublime2-bundle'
  }

  sublime_text_2::package { 'CoffeeScript':
    source => 'Xavura/CoffeeScript-Sublime-Plugin'
  }
  file { "/Users/${::luser}/Library/Application Support/Sublime Text 2/Packages/User/":
    ensure => "directory"
  }

  file { "/Users/${::luser}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    ensure  => file,
    source  => 'puppet:///modules/sublime/Preferences.sublime-settings',
    force   => true,
    group   => 'wheel',
    owner   => $::luser,
    require => Package['SublimeText2'],
  }

  file { "/Applications/Sublime Text 2.app/Contents/Resources/Sublime Text 2.icns":
    ensure  => file,
    source  => 'puppet:///modules/sublime/Sublime Text 2.icns',
    force   => true,
    group   => 'wheel',
    owner   => $::luser,
    require => Package['SublimeText2'],
  }
}
