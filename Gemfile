source "https://rubygems.org"
ruby "2.3.0"

# FRAMEWORK
gem "rails", "~> 4.2.5"

# SERVER
gem "puma"
gem "rack-cache"
gem "rack-timeout"

# DB
gem "pg"

# AUTH
# gem "bcrypt", "~> 3.1.7" # ActiveModel has_secure_password
# gem "sorcery", "~> 0.9.0" # Minor verson updates break backwards compatability, see upgrading: http://rubydoc.info/gems/sorcery

# ASSETS & UI
gem "uglifier"
gem "sass-rails"
gem "coffee-rails"
gem "jquery-rails"
gem "autoprefixer-rails"
gem "angular_rails_csrf"

# SERVICE INTEGRATIONS
gem "postmark-rails"
gem "skylight"

group :development, :test do
  gem "byebug"
  gem "dotenv-rails"
end

group :development do
  gem "derailed"
  gem "stackprof"
  gem "table_print"
  gem "web-console", "~> 2.0" # Access an IRB console on exception pages or by using <%= console %> in views
end

group :test do
  gem "rspec-rails"
end

group :production do
  gem "rails_12factor"
  gem "exception_notification"
end
