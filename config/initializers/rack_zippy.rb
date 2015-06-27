# Use rack-zippy to serve our assets with gzip
Rails.application.config.middleware.swap(ActionDispatch::Static, Rack::Zippy::AssetServer)
