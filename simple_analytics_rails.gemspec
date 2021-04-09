require_relative "lib/simple_analytics_rails/version"

Gem::Specification.new do |spec|
  spec.name = "simple_analytics_rails"
  spec.version = SimpleAnalyticsRails::VERSION
  spec.authors = ["Mike Rogers"]
  spec.email = ["me@mikerogers.io"]

  spec.summary = "Add the Simple Analytics JavaScript Script to your Rails app"
  spec.description = spec.summary
  spec.homepage = "https://simpleanalytics.com/"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/simpleanalytics/rubyonrails-plugin"
  spec.metadata["changelog_uri"] = "https://github.com/simpleanalytics/rubyonrails-plugin/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rails", ">= 5.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standardrb", "~> 1.0"
  spec.add_development_dependency "rspec-rails", "~> 4.0"
  spec.add_development_dependency "yard", "~> 0.9.26"
end
