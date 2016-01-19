class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Exception, with: :server_error if Rails.env == "production"
  
private
  
  def require_merchant
    redirect_to :wholesale unless session[:merchant_email].present?
  end
  
  def server_error(exception)
    ExceptionNotifier.notify_exception(exception, env: request.env)
    render "static/server_err", status: 500
  end
end
