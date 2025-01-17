source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites
gem 'simplecov', require: false, group: :test

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

#Aesthetics
gem "active_material", github: "vigetlabs/active_material"
gem "recaptcha", require: "recaptcha/rails"
#gem 'better_errors', '~> 2.5', '>= 2.5.1'
gem "rspec-rails", :group => [:development, :test]


gem "binding_of_caller"
# bootstrap 
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'
gem 'rails-assets-jquery', source:'http://rails-assets.org'
gem 'rails-assets-datatables', source:'http://rails-assets.org'
gem "font-awesome-rails"
gem 'font-awesome-sass', '~> 5.12.0'
gem "bootstrap_form", "~> 4.0"

gem 'devise'
gem 'activeadmin'
gem 'faker'
gem 'date'
gem 'whenever', require: false
gem "chartkick"
gem 'groupdate'
gem "figaro"

gem 'rails-controller-testing', '~> 0.0.3'

# slack api
gem 'slack-ruby-client'
gem 'async-websocket', '~> 0.8.0'
gem 'http'
gem 'slack-notifier'


# zendesk api
gem "zendesk_api", git: 'https://github.com/zendesk/zendesk_api_client_rb'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# OwlCarousel gem
gem 'owlcarousel-rails', '~> 1.1', '>= 1.1.3.3'

# Mix it up gem
gem 'mixitup-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.14', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-bundler', '>= 1.1.0'
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-puma'
  gem 'capistrano-rake', require: false
  gem 'capistrano-rvm'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
#sendGrid
gem 'sendgrid-ruby'
gem 'json', '~> 1.8', '>= 1.8.3'
gem 'twilio-ruby'
gem 'phonelib'
gem 'ibm_watson'
gem 'dropbox_api'
gem 'dotenv'
gem 'azure-storage-blob'
gem 'carrierwave', '~> 2.0'