class projects::butler {
  boxen::project { 'butler':
    postgresql = > true,
    ruby       = > '2.1.0',
    source     = > 'poetic/butler-api'
  }
}
