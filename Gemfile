source "https://rubygems.org"
ruby "2.3.0"

# FRAMEWORK
gem "rails", "~> 4.2.5"

# DB — Must come before SERVER
gem "pg"

# SERVER
gem "puma"
gem "rack-cache"
gem "rack-mini-profiler" # Must come after DB
gem "rack-timeout"

# AUTH
# gem 'bcrypt-ruby', :require => 'bcrypt'
# gem "bcrypt", "~> 3.1.7" # ActiveModel has_secure_password
# gem "sorcery", "~> 0.9.0" # Minor verson updates break backwards compatability, see upgrading: http://rubydoc.info/gems/sorcery

# ASSETS & UI
gem "angular_rails_csrf"
gem "autoprefixer-rails"
gem "coffee-rails"
gem "jquery-rails"
gem "sass-rails"
gem "uglifier"

# SERVICE INTEGRATIONS
gem "postmark-rails"
gem "skylight"

# IMAGE UPLOADS
gem 'aws-sdk', '~> 2'
gem "jquery-fileupload-rails"

# MISC
gem "money-rails"
gem "google_currency"

group :development, :test do
  gem "byebug"
  gem "dotenv-rails"
end

group :development do
  gem "bullet"
  gem "derailed"
  gem "stackprof"
  gem "table_print"
  gem "web-console", "~> 2.0" # Access an IRB console on exception pages or by using <%= console %> in views
end

group :test do
  gem "rspec-rails"
end

group :production do
  gem "exception_notification"
  gem "rails_12factor"
end
