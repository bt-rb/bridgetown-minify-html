# frozen_string_literal: true

source "https://rubygems.org"
gemspec

gem "bridgetown", ENV["BRIDGETOWN_VERSION"] if ENV["BRIDGETOWN_VERSION"]

group :development, :test do
  gem "github_changelog_generator", "~> 1.15.2"
  gem "rubocop", "~> 0.81.0"
end
