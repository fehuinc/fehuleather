Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Configure CORS
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ["https://www.fehuleather.com", "https://fehu-staging.herokuapp.com", "http://www.frails.dev"]
      resource "*", :headers => :any, :methods => [:get, :head, :options]
    end
  end

  # Set the default time zone and enables time zone awareness for Active Record
  config.time_zone = "UTC"

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
  # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
  # `config/secrets.yml.key`.
  config.read_encrypted_secrets = false # was: true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = true
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{2.days.seconds.to_i}" }

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.action_controller.asset_host = ENV.fetch("ASSET_HOST")

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Enable HSTS when using subdomains
  # config.ssl_options = { hsts: { subdomains: true } } # NEW

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :info # Changed from :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "fehu_rails_#{Rails.env}"
  config.action_mailer.perform_caching = false

  # Send email with postmark
  config.action_mailer.delivery_method = :postmark
  config.action_mailer.postmark_settings = { :api_key => ENV['POSTMARK_API_KEY'] }

  # Specify what domain to use for mailer URLs and assets (like images)
  config.action_mailer.asset_host = ENV.fetch("ASSET_HOST")

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Configure Exception Notifications
  Rails.application.config.middleware.use ExceptionNotification::Rack,
    email: {
      email_prefix: "Fehu Error: ",
      sender_address: %{Fehu <ivan@fehuleather.com>},
      exception_recipients: %w{ivanreese@gmail.com},
      email_format: :html
    }

end
