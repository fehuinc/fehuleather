class WholesaleController < ApplicationController
  
  def index
    @merchant = Merchant.find_by_id(session[:merchant_id])
    redirect_to logout_merchant_path if @merchant.nil?
  end
  
  def login
    # The only way we arrive at this action is if session[:merchant_id] is nil
    # Otherwise, we'd have hit the 'main' action
    
    # Haven't yet attempted to log in
    if login_params[:email].nil?
      
      # We'll pre-populate the form with the current merchant email, just to make it easier
      @merchant = Merchant.new(email: session[:merchant_email])
      # Exit: Render login
    
    # Logging in as existing merchant
    elsif existing_merchant = Merchant.find_by_email(login_params[:email])
      reset_session # For security
      session[:merchant_id] = existing_merchant.id
      session[:merchant_email] = existing_merchant.email
      redirect_to wholesale_path # Exit: redirect
    
    else
      @merchant = Merchant.new(login_params)
      @merchant.valid? # Run validations
      
      # Email was invalid
      if @merchant.errors[:email].any?
        @merchant.errors.clear # Ignore errors on other fields
        @merchant.errors.add(:email, "is invalid")
        # Exit: Render login, with error
      
      # Need to create a new merchant
      else
        session[:merchant_email] = login_params[:email]
        redirect_to new_merchant_path # Exit: redirect

      end
    end
  end
  
private
  
  def login_params
    params.fetch(:merchant, {}).permit(:email)
  end
  
end
