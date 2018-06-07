class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Exception, with: :server_error
  before_action :block_robots if ENV.fetch("NO_ROBOTS") == "true"
  before_action :set_xsrf_token_cookie

private


  def require_merchant
    redirect_to :wholesale unless session[:merchant_email].present?
  end


  # Extracted from: https://github.com/jsanders/angular_rails_csrf/blob/master/lib/angular_rails_csrf/concern.rb
  # See also: http://stackoverflow.com/questions/7600347/rails-api-design-without-disabling-csrf-protection
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
      generic_error(exception, false, 504)
    else
      generic_error(exception, true, 500)
    end
  end


  def generic_error(exception, notify, status)
    ExceptionHandler.notify_exception(exception, env: request.env) if notify
    if Rails.env.production?
      @server_error = true
      unless performed?
        respond_to do |format|
          format.html { render "static/server_error", status: status }
          format.all  { head status }
        end
      end
    else
      raise exception
    end
  end


  def block_robots
    response.headers["X-Robots-Tag"] = "noindex"
  end

  def skip_bullet
    # Bullet.enable = false if Rails.env == "development"
    yield
  ensure
    # Bullet.enable = true if Rails.env == "development" and ENV["BULLET"] == "true"
  end
end
