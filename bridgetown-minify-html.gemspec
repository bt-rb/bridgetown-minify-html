# frozen_string_literal: true

require_relative "lib/bridgetown-minify-html/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-minify-html"
  spec.version       = BridgetownMinifyHtml::VERSION
  spec.authors = ["Mike Rogers", "Andrew Mason"]
  spec.email         = "support@andrewm.codes"
  spec.summary       = "Minify Outputted HTML in Bridgetown"
  spec.homepage      = "https://github.com/bt-rb/bridgetown-minify-html"
  spec.license       = "MIT"

  spec.metadata = {
    'bug_tracker_uri' => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/main/CHANGELOG.md",
    'documentation_uri' => spec.homepage,
    'homepage_uri' => spec.homepage,
    "source_code_uri" => spec.homepage
  }

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^spec/!)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "bridgetown", ">= 1.2.0", "< 2.0"
  spec.add_dependency "htmlcompressor", ">= 0.4", "< 1.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.3"
end
