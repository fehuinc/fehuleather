Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Configure CORS
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "*"
      resource "*", :headers => :any, :methods => [:get, :head, :options]
    end
  end
  
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true
  
  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    
    config.cache_store = :null_store
  end
  
  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true # Ivan changed, was false
  
  config.action_mailer.perform_caching = false
  
  # Ivan added:
  # Specify what domain to use for mailer URLs and assets (like images)
  config.action_mailer.default_url_options = { host: ENV["DOMAIN"] }
  config.action_mailer.asset_host = ENV["DOMAIN"]
  
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false # Ivan: Must be false for Angular stuff to work
  
  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Configure Bullet
  config.after_initialize do
    Bullet.enable = true
    Bullet.add_footer = true     # bottom left
    Bullet.alert = false         # pop up a JavaScript alert in the browser
    Bullet.bullet_logger = false # log to the Bullet log file (/log/bullet.log)
    Bullet.console = true        # console.log
    Bullet.rails_logger = false  # add warnings directly to the Rails log
  end
end
