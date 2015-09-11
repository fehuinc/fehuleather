source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '~> 4.2.4'

# SERVER
gem 'unicorn'
gem 'rack-zippy'
# gem 'jbuilder', '~> 2.0' # JSON APIs with ease. Read more: https://github.com/rails/jbuilder

# AUTH
# gem 'bcrypt', '~> 3.1.7' # ActiveModel has_secure_password
# gem 'sorcery', '~> 0.9.0' # Minor verson updates break backwards compatability, see upgrading: http://rubydoc.info/gems/sorcery

# ASSETS & UI
gem 'uglifier'
gem 'sass-rails'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'autoprefixer-rails'
gem 'angular_rails_csrf'

# SERVICE INTEGRATIONS
# gem 'postmark-rails'

group :development do
  gem 'web-console', '~> 2.0' # Access an IRB console on exception pages or by using <%= console %> in views
  gem "table_print"
end

group :development, :test do
  gem 'sqlite3'
  gem 'dotenv-rails'
  gem 'byebug' # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :test do
  gem 'rspec-rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
