source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "3.0.4"

gem "activerecord-import"
gem "bootsnap", require: false
gem "config"
gem "figaro"
gem "importmap-rails"
gem "jbuilder"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
gem "csv"

group :development, :test do
  gem "debug", platforms: %i(mri mingw x64_mingw)
  gem "pry-rails"
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
  gem "faker"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
