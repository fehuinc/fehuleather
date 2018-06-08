module MerchantAuth
  extend ActiveSupport::Concern

  included do
    prepend_before_action :check_authentication
  end

  # FILTERS & SUCH ################################################################################


  def check_authentication
    return unless session_is_valid
    merchant = Merchant.find_by_id(session[:merchant_id])
    return unless merchant
    resume_authenticated_merchant merchant
  end


  def session_is_valid
    # Not logged in? Then we don't need to bother with the session.
    if session[:merchant_id].blank?
      false

    # Logging out? Then our session is about to be wiped anyway, so it doesn't matter.
    elsif params[:controller] == "merchant/logout"
      false

    # Session is valid
    else
      true
    end
  end


  # AUTH HELPERS ##################################################################################


  def current_merchant
    @current_merchant
  end


  def logged_in?
    current_merchant.present?
  end


  # AUTH FILTERS ##################################################################################


  def require_merchant
    redirect_to :wholesale unless session[:merchant_email].present?
  end


  # AUTHENTICATION ################################################################################


  def authenticate(email, password)
    if merchant = Merchant.authenticate(email, password)
      rebuild_session
      set_authenticated_merchant merchant
    end
  end


  def deauthenticate
    set_authenticated_merchant nil
  end


  def set_authenticated_merchant(merchant)
    if merchant
      session[:merchant_id] = merchant.id
      session[:merchant_email] = merchant.email # Make future login easier
      resume_authenticated_merchant(merchant)
      merchant
    else
      @current_merchant = nil
      reset_session
      nil
    end
  end


  def resume_authenticated_merchant(merchant)
    @current_merchant = merchant
  end


  def rebuild_session
    # This protects us from session fixation
    old_session = session.dup.to_hash
    reset_session
    old_session.each_pair { |k, v|
      # The below version was disabled because it probably doesn't do the right thing.
      session[k.to_sym] = v
      #session[k.to_sym] = v unless k.to_sym == :_csrf_token # form_authenticity_token sets session[:_csrf_token] using ||=, so we'll skip the old one
    }
    form_authenticity_token
  end


end
