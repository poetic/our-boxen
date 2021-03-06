require "json"

facts       = {}
dot_boxen   = "#{ENV['HOME']}/.boxen"
user_config = "#{dot_boxen}/config.json"

if RUBY_PLATFORM =~ /darwin/
  require "boxen/config"
  config = Boxen::Config.load

  facts["github_login"]  = config.login
  facts["github_email"]  = config.email
  facts["github_name"]   = config.name
  facts["github_token"]  = config.token

  facts["boxen_home"]    = config.homedir
  facts["boxen_srcdir"]  = config.srcdir
  facts["boxen_repodir"] = config.repodir
  facts["boxen_user"]    = config.user
  facts["luser"]         = config.user # this is goin' away
else
  facts["github_login"]  = ENV['GITHUB_LOGIN']
  facts["github_email"]  = ENV['GITHUB_EMAIL']
  facts["github_name"]   = ENV['GITHUB_NAME']
  facts["github_token"]  = ENV['GITHUB_TOKEN']
  facts["boxen_home"]    = ENV['BOXEN_HOME']
  facts["boxen_srcdir"]  = ENV['BOXEN_SRCDIR']
  facts["boxen_repodir"] = ENV['BOXEN_REPODIR']
  facts["boxen_user"]    = ENV['BOXEN_USER']
  facts["luser"]         = ENV['BOXEN_USER']
end

Dir["#{facts['boxen_home']}/config/facts/*.json"].each do |file|
  facts.merge! JSON.parse File.read file
end

if File.directory?(dot_boxen) && File.file?(user_config)
  facts.merge! JSON.parse(File.read(user_config))
end

if File.file?(dot_boxen)
  warn "DEPRECATION: ~/.boxen is deprecated and will be removed in 2.0; use ~/.boxen/config.json instead!"
  facts.merge! JSON.parse(File.read(dot_boxen))
end

facts.each { |k, v| Facter.add(k) { setcode { v } } }
