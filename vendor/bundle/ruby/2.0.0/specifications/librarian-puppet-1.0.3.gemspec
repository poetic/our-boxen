# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "librarian-puppet"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Sharpe"]
  s.date = "2014-06-07"
  s.description = "Simplify deployment of your Puppet infrastructure by\n  automatically pulling in modules from the forge and git repositories with\n  a single command."
  s.email = ["tim@sharpe.id.au"]
  s.executables = ["librarian-puppet"]
  s.files = ["bin/librarian-puppet"]
  s.homepage = "https://github.com/rodjek/librarian-puppet"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Bundler for your Puppet modules"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<librarian>, [">= 0.1.2"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
      s.add_development_dependency(%q<puppet>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 5"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<librarian>, [">= 0.1.2"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<aruba>, [">= 0"])
      s.add_dependency(%q<puppet>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 5"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<librarian>, [">= 0.1.2"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<aruba>, [">= 0"])
    s.add_dependency(%q<puppet>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 5"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
