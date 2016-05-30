class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Exception, with: :server_error if Rails.env == "production"
  before_action :mini_profiler
  
  
private
  
  
  def require_merchant
    redirect_to :wholesale unless session[:merchant_email].present?
  end
  
  def server_error(exception)
    case exception
    when ActionController::InvalidAuthenticityToken
      reset_session
      flash[:notice] = "Your session has expired. Please try again."
      redirect_to root_path
    else
      ExceptionNotifier.notify_exception(exception, env: request.env)
      render "static/server_error", status: 500
    end
  end

  def mini_profiler
    Rack::MiniProfiler.authorize_request if Access.admin?(session)
  end
  
  def skip_bullet
    Bullet.enable = false
    yield
  ensure
    Bullet.enable = true
  end
end
