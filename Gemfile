source 'https://rubygems.org'

gem 'rails',                  "3.2.11"
gem 'jquery-rails'
gem "bootstrap-sass",         ">= 2.1.0.0"
gem "devise",                 ">= 2.1.2"
gem "cancan",                 ">= 1.6.8"
gem "rolify",                 ">= 3.2.0"
gem "simple_form",            ">= 2.0.3"
gem 'faker',                  '1.0.1'

group :assets do
  gem 'sass-rails',           "~> 3.2.3"
  gem 'coffee-rails',         "~> 3.2.1"
  gem 'uglifier',             ">= 1.0.3"
end

group :development, :test do
  gem 'sqlite3',              '1.3.5'
  gem "rspec-rails",          ">= 2.11.0"
  gem "factory_girl_rails",   ">= 4.1.0"
  gem 'guard-rspec',          '0.5.5'
  gem 'guard-spork',          '0.3.2'
  gem 'spork',                '0.9.0'
end

group :development do
  gem "quiet_assets",         ">= 1.0.1"
  gem 'annotate',             "2.5.0"
end

group :test do
  gem "email_spec",           ">= 1.2.1"
  gem "cucumber-rails",       ">= 1.3.0", :require => false
  gem "database_cleaner",     ">= 0.8.0"
  gem "launchy",              ">= 2.1.2"
  gem "capybara",             ">= 1.1.2"
  gem 'rb-fsevent',           '0.9.1',    :require => false
end

group :production do
  gem 'pg', '0.12.2'
end