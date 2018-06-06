# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:confirmation, :cookie, :csrf, :password, :salt, :secret, :session]

# Configure sensitive URLs which will be filtered from the log file.
Rails.application.config.filter_redirect << "amazonaws.com" # Filter AWS because we might start using secure tokens
