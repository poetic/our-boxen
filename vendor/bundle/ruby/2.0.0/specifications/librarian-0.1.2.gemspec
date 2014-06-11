# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "librarian"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jay Feldblum"]
  s.date = "2014-02-09"
  s.description = "A Framework for Bundlers."
  s.email = ["y_feldblum@yahoo.com"]
  s.homepage = "https://github.com/applicationsonline/librarian"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "A Framework for Bundlers."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.15"])
      s.add_runtime_dependency(%q<highline>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<fakefs>, ["~> 0.4.2"])
    else
      s.add_dependency(%q<thor>, ["~> 0.15"])
      s.add_dependency(%q<highline>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<fakefs>, ["~> 0.4.2"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.15"])
    s.add_dependency(%q<highline>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<fakefs>, ["~> 0.4.2"])
  end
end
