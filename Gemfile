source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'pg'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'nokogiri', '~> 1.6', '>= 1.6.7.2'
gem 'bootsnap', '>= 1.1.2', require: false

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate'
  gem 'foreman'
  gem 'rubocop', require: false
end

group :test do
  gem 'shoulda-matchers'
end
