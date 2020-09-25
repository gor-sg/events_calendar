# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.1.2', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3.3'
gem 'nokogiri', '~> 1.6', '>= 1.6.7.2'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'whenever', '~> 0.10.0', require: false
gem 'sidekiq', '~> 5.2.6'
gem 'doorkeeper'
gem 'bcrypt'
gem 'oauth2'

group :development, :test do
  gem 'byebug', '~> 11.0.1', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug', '~> 3.7.0'
end

group :development do
  gem 'annotate', '~> 2.7.4'
  gem 'dotenv-rails', '~> 2.7.2'
  gem 'foreman', '~> 0.85.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rspec-rails', '~> 3.8.2'
  gem 'rubocop', '~> 0.67.2', require: false
end

group :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'faker', '~> 1.9.3'
  gem 'shoulda-matchers', '~> 4.0.1'
  gem 'timecop', '~> 0.9.1'
  gem 'capybara', '~> 3.17.0'
end
