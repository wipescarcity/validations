# frozen_string_literal: true

require_relative "lib/validation/version"

Gem::Specification.new do |spec|
  spec.name = "validation"
  spec.version = Validation::VERSION
  spec.authors = ["wipescarcity"]
  spec.email = ["56118890+wipescarcity@users.noreply.github.com"]

  spec.summary = "A flexible and extensible Ruby gem for validating product attributes and specifications"
  spec.description = "Validation provides a robust framework for validating product attributes, specifications, and metadata. It offers customizable validation rules, built-in validators for common product properties, and an easy-to-extend architecture for domain-specific validation needs."
  spec.homepage = "https://github.com/wipescarcity/validation"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wipescarcity/validation"
  spec.metadata["changelog_uri"] = "https://github.com/wipescarcity/validation/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
