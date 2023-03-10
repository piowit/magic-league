source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false
gem "devise"
gem "simple_form"
gem "cssbundling-rails", "~> 1.1"
gem "jsbundling-rails", "~> 1.1"
gem "foreman"
gem "view_component"
gem "lookbook"
gem "trestle"
gem "trestle-auth"
gem "pundit"

group :development, :test do
  # rspec
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: "main"
  end

  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "pry"
  gem "factory_bot_rails"
  gem "faker"
  gem "standard"
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end
