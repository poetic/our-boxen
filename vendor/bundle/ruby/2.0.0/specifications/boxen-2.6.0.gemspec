# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "boxen"
  s.version = "2.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Barnette", "Will Farrington", "David Goodlad"]
  s.date = "2014-04-14"
  s.description = "Manage Mac development boxes with love (and Puppet)."
  s.email = ["jbarnette@github.com", "wfarr@github.com", "dgoodlad@github.com"]
  s.homepage = "https://github.com/boxen/boxen"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "You know, for laptops and stuff."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ansi>, ["~> 1.4"])
      s.add_runtime_dependency(%q<hiera>, ["~> 1.0"])
      s.add_runtime_dependency(%q<highline>, ["~> 1.6"])
      s.add_runtime_dependency(%q<json_pure>, ["< 2.0", ">= 1.7.7"])
      s.add_runtime_dependency(%q<librarian-puppet>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<octokit>, [">= 2.7.1", "~> 2.7"])
      s.add_runtime_dependency(%q<puppet>, ["~> 3.0"])
      s.add_development_dependency(%q<minitest>, ["= 4.4.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.13"])
    else
      s.add_dependency(%q<ansi>, ["~> 1.4"])
      s.add_dependency(%q<hiera>, ["~> 1.0"])
      s.add_dependency(%q<highline>, ["~> 1.6"])
      s.add_dependency(%q<json_pure>, ["< 2.0", ">= 1.7.7"])
      s.add_dependency(%q<librarian-puppet>, ["~> 1.0.0"])
      s.add_dependency(%q<octokit>, [">= 2.7.1", "~> 2.7"])
      s.add_dependency(%q<puppet>, ["~> 3.0"])
      s.add_dependency(%q<minitest>, ["= 4.4.0"])
      s.add_dependency(%q<mocha>, ["~> 0.13"])
    end
  else
    s.add_dependency(%q<ansi>, ["~> 1.4"])
    s.add_dependency(%q<hiera>, ["~> 1.0"])
    s.add_dependency(%q<highline>, ["~> 1.6"])
    s.add_dependency(%q<json_pure>, ["< 2.0", ">= 1.7.7"])
    s.add_dependency(%q<librarian-puppet>, ["~> 1.0.0"])
    s.add_dependency(%q<octokit>, [">= 2.7.1", "~> 2.7"])
    s.add_dependency(%q<puppet>, ["~> 3.0"])
    s.add_dependency(%q<minitest>, ["= 4.4.0"])
    s.add_dependency(%q<mocha>, ["~> 0.13"])
  end
end
