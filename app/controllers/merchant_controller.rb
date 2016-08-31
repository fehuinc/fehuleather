class MerchantController < ApplicationController
  
  def logout
    merchant = Merchant.find_by_id(session[:merchant_id])
    session[:merchant_email] = merchant.email if merchant.present? # Make future login easier
    session[:merchant_id] = nil
    redirect_to root_path
  end
  
  
  
  # NOT LOGGED IN #################################################################################
  # session[:merchant_email] is set
  # session[:merchant_id] is not set
  
  def new
    @merchant = Merchant.new(email: session[:merchant_email])
  end
  
  
  def create
    @merchant = Merchant.new(merchant_params)
    
    if @merchant.valid?
      new_merchant = Merchant.create!(merchant_params)
      reset_session # For security
      session[:merchant_id] = new_merchant.id
      session[:merchant_email] = new_merchant.email
      redirect_to merchant_path
    
    else
      render :new
      
    end
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
      redirect_to merchant_path # Exit: redirect
    
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

  
  # LOGGED IN #####################################################################################
  # session[:merchant_email] is set
  # session[:merchant_id] is set
  
  
  def update
    @merchant = Merchant.find(session[:merchant_id])
    
    if @merchant.update merchant_params
      session[:merchant_email] = @merchant.email
      flash[:notice] = "Saved"
      redirect_to merchant_path
    
    else
      render :index
    
    end
  end
  
  
  def index
    @merchant = Merchant.find_by_id(session[:merchant_id])
    redirect_to logout_merchant_path if @merchant.nil?
  end
  
  
private
  
  def login_params
    params.fetch(:merchant, {}).permit(:email)
  end
  
  def merchant_params
    params.require(:merchant).permit(:id, :email, :phone_number, :store_name, :your_name)
  end
  
end
