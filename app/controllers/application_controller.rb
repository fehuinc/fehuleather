class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Exception, with: :server_error if Rails.env == "production"
  before_action :block_robots if ENV.fetch("NO_ROBOTS") == "true"
  before_action :set_xsrf_token_cookie
  before_action :mini_profiler
  
private
  
  
  def require_merchant
    redirect_to :wholesale unless session[:merchant_email].present?
  end
  
  
  # Extracted from: https://github.com/jsanders/angular_rails_csrf/blob/master/lib/angular_rails_csrf/concern.rb
  def set_xsrf_token_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
  
  def verified_request?
    if respond_to?(:valid_authenticity_token?, true)
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    else
      super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
    end
  end
  
  
  def server_error(exception)
    case exception
    when ActionController::InvalidAuthenticityToken
      reset_session
      flash[:notice] = "Your session has expired. Please try again."
      redirect_to root_path
    when Rack::Timeout::RequestTimeoutException
      # Don't send an email, to avoid Ivan getting 3000 emails all at once.. again.
      @server_error = true
      render "static/server_error", status: 504 unless performed?
    else
      ExceptionNotifier.notify_exception(exception, env: request.env)
      render "static/server_error", status: 500
    end
  end

  def block_robots
    response.headers["X-Robots-Tag"] = "noindex"
  end

  def mini_profiler
    Rack::MiniProfiler.authorize_request if Access.admin?(session)
  end
  
  def skip_bullet
    Bullet.enable = false if Rails.env == "development"
    yield
  ensure
    Bullet.enable = true if Rails.env == "development"
  end
end
