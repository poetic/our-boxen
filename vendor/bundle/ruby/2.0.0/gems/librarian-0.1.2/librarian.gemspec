# -*- encoding: utf-8 -*-
# stub: librarian 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "librarian"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jay Feldblum"]
  s.date = "2014-02-09"
  s.description = "A Framework for Bundlers."
  s.email = ["y_feldblum@yahoo.com"]
  s.files = [".gitignore", ".rspec", ".travis.yml", "CHANGELOG.md", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "VERSION", "lib/librarian.rb", "lib/librarian/action.rb", "lib/librarian/action/base.rb", "lib/librarian/action/clean.rb", "lib/librarian/action/ensure.rb", "lib/librarian/action/install.rb", "lib/librarian/action/persist_resolution_mixin.rb", "lib/librarian/action/resolve.rb", "lib/librarian/action/update.rb", "lib/librarian/algorithms.rb", "lib/librarian/cli.rb", "lib/librarian/cli/manifest_presenter.rb", "lib/librarian/config.rb", "lib/librarian/config/database.rb", "lib/librarian/config/file_source.rb", "lib/librarian/config/hash_source.rb", "lib/librarian/config/source.rb", "lib/librarian/dependency.rb", "lib/librarian/dsl.rb", "lib/librarian/dsl/receiver.rb", "lib/librarian/dsl/target.rb", "lib/librarian/environment.rb", "lib/librarian/environment/runtime_cache.rb", "lib/librarian/error.rb", "lib/librarian/helpers.rb", "lib/librarian/linter/source_linter.rb", "lib/librarian/lockfile.rb", "lib/librarian/lockfile/compiler.rb", "lib/librarian/lockfile/parser.rb", "lib/librarian/logger.rb", "lib/librarian/manifest.rb", "lib/librarian/manifest_set.rb", "lib/librarian/mock.rb", "lib/librarian/mock/cli.rb", "lib/librarian/mock/dsl.rb", "lib/librarian/mock/environment.rb", "lib/librarian/mock/extension.rb", "lib/librarian/mock/source.rb", "lib/librarian/mock/source/mock.rb", "lib/librarian/mock/source/mock/registry.rb", "lib/librarian/mock/version.rb", "lib/librarian/posix.rb", "lib/librarian/resolution.rb", "lib/librarian/resolver.rb", "lib/librarian/resolver/implementation.rb", "lib/librarian/rspec/support/cli_macro.rb", "lib/librarian/source.rb", "lib/librarian/source/basic_api.rb", "lib/librarian/source/git.rb", "lib/librarian/source/git/repository.rb", "lib/librarian/source/local.rb", "lib/librarian/source/path.rb", "lib/librarian/spec.rb", "lib/librarian/spec_change_set.rb", "lib/librarian/specfile.rb", "lib/librarian/support/abstract_method.rb", "lib/librarian/ui.rb", "lib/librarian/version.rb", "librarian.gemspec", "spec/functional/cli_spec.rb", "spec/functional/posix_spec.rb", "spec/functional/source/git/repository_spec.rb", "spec/functional/source/git_spec.rb", "spec/support/fakefs.rb", "spec/support/method_patch_macro.rb", "spec/support/project_path_macro.rb", "spec/support/with_env_macro.rb", "spec/unit/action/base_spec.rb", "spec/unit/action/clean_spec.rb", "spec/unit/action/ensure_spec.rb", "spec/unit/action/install_spec.rb", "spec/unit/algorithms_spec.rb", "spec/unit/config/database_spec.rb", "spec/unit/dependency/requirement_spec.rb", "spec/unit/dependency_spec.rb", "spec/unit/dsl_spec.rb", "spec/unit/environment/runtime_cache_spec.rb", "spec/unit/environment_spec.rb", "spec/unit/lockfile/parser_spec.rb", "spec/unit/lockfile_spec.rb", "spec/unit/manifest/version_spec.rb", "spec/unit/manifest_set_spec.rb", "spec/unit/manifest_spec.rb", "spec/unit/mock/environment_spec.rb", "spec/unit/mock/source/mock_spec.rb", "spec/unit/resolver_spec.rb", "spec/unit/source/git_spec.rb", "spec/unit/spec_change_set_spec.rb"]
  s.homepage = "https://github.com/applicationsonline/librarian"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.3"
  s.summary = "A Framework for Bundlers."
  s.test_files = ["spec/functional/cli_spec.rb", "spec/functional/posix_spec.rb", "spec/functional/source/git/repository_spec.rb", "spec/functional/source/git_spec.rb", "spec/support/fakefs.rb", "spec/support/method_patch_macro.rb", "spec/support/project_path_macro.rb", "spec/support/with_env_macro.rb", "spec/unit/action/base_spec.rb", "spec/unit/action/clean_spec.rb", "spec/unit/action/ensure_spec.rb", "spec/unit/action/install_spec.rb", "spec/unit/algorithms_spec.rb", "spec/unit/config/database_spec.rb", "spec/unit/dependency/requirement_spec.rb", "spec/unit/dependency_spec.rb", "spec/unit/dsl_spec.rb", "spec/unit/environment/runtime_cache_spec.rb", "spec/unit/environment_spec.rb", "spec/unit/lockfile/parser_spec.rb", "spec/unit/lockfile_spec.rb", "spec/unit/manifest/version_spec.rb", "spec/unit/manifest_set_spec.rb", "spec/unit/manifest_spec.rb", "spec/unit/mock/environment_spec.rb", "spec/unit/mock/source/mock_spec.rb", "spec/unit/resolver_spec.rb", "spec/unit/source/git_spec.rb", "spec/unit/spec_change_set_spec.rb"]

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
