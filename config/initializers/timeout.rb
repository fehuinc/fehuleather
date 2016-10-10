Rack::Timeout.service_timeout = ENV.fetch("RACK_TIMEOUT", 20).to_i # seconds
