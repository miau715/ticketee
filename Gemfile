source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'dynamic_form'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test, :development do
  gem 'rspec-rails', '~> 2.5'
  gem 'gmail'
end

group :development do
  gem 'hirb'
  gem 'wirble'
  gem 'map_by_method'
  gem 'capistrano'
end

group :test do
  gem 'cucumber-rails', '= 1.0.6'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'email_spec'
  gem 'launchy'
end

group :production do
  gem 'mysql2'
end

gem 'devise', '~> 1.4.3'
gem 'cancan'
gem 'paperclip'
gem 'searcher'
gem 'rake'
gem "oa-oauth", :require => "omniauth/oauth"
