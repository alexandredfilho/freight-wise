# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.8', '>= 7.0.8.1'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'cancancan'
gem 'devise'
gem 'devise-jwt'
gem 'dotenv-rails'
gem 'jsonapi-serializer'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem 'annotate'
  gem 'awesome_print'
  gem 'brakeman'
  gem 'bundler-audit', require: false
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'rubocop-rails', require: false
  gem 'rubycritic', require: false
  gem 'ruby-lsp', require: false
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console'
end
