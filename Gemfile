source "https://rubygems.org"
ruby "2.5.1"

# FRAMEWORK
gem "rails", "~> 5.2.0"

# DB — Must come before SERVER
gem "pg"

# SERVER
gem "bootsnap", require: false
gem "puma"
# gem "rack-cache"
gem "rack-cors", :require => "rack/cors"
gem "rack-timeout"

# AUTH
gem "bcrypt"

# LOGGING
gem "lograge"

# ASSETS & UI
gem "autoprefixer-rails"
gem "coffee-rails"
gem "jquery-rails"
gem "sass-rails"
gem "uglifier"

# SERVICE INTEGRATIONS
gem "aws-sdk", "~> 2"
gem "postmark-rails"
gem "stripe"

# IMAGE UPLOADS
gem "jquery-fileupload-rails"

# MISC
gem "money-rails"
gem "money-oxr"

group :development, :test do
  gem "byebug"
  gem "dotenv-rails"
end

group :development do
  # gem "bullet"
  # gem "derailed"
  # gem "stackprof"
  # gem "table_print"
  gem "web-console" # Access an IRB console on exception pages or by using <%= console %> in views
end

group :test do
  gem "rspec-rails"
end

group :production do
  gem "exception_notification"
  gem "skylight"
end
