source 'https://rubygems.org'

ruby file: '.tool-versions'

gemspec

gem 'rails', github: 'rails/rails', branch: '8-0-stable'

gem 'amazing_print', '~> 1.6'
gem 'marginalia', '~> 1.11'
gem 'propshaft', '~> 1.1'
gem 'puma', '~> 6.4'

gem 'bootsnap', '~> 1.18', require: false

group :development, :test do
  gem 'debug', '~> 1.9', require: 'debug/prelude'
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker', '~> 3.4'

  gem 'brakeman', '~> 6.2', require: false
  gem 'i18n-tasks', '~> 1.0', require: false
end

group :development do
  gem 'web-console', '~> 4.2'

  gem 'erb_lint', '~> 0.7.0', require: false
  gem 'rubocop', '~> 1.66', require: false
  gem 'rubocop-capybara', '~> 2.21', require: false
  gem 'rubocop-factory_bot', '~> 2.26', require: false
  gem 'rubocop-faker', '~> 1.1', require: false
  gem 'rubocop-minitest', '~> 0.36.0', require: false
  gem 'rubocop-performance', '~> 1.22', require: false
  gem 'rubocop-rails', '~> 2.26', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
end

group :test do
  gem 'capybara', '~> 3.40'
  gem 'selenium-webdriver', '~> 4.25'

  gem 'mocha', '~> 2.4', require: false
  gem 'simplecov', '~> 0.22.0', require: false
  gem 'webmock', '~> 3.24', require: false
end
