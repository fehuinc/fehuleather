class MerchantsController < ApplicationController
  
  def logout
    merchant = Merchant.find_by_id(session[:merchant_id])
    if merchant.present?
      session[:merchant_email] = merchant.email # Make future login easier
      session[:merchant_id] = nil
    end
    redirect_to :root
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
      redirect_to wholesale_path
    
    else
      render :new
      
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
      redirect_to wholesale_path
    
    else
      render :edit
    
    end
  end
  
private
  
  def merchant_params
    params.require(:merchant).permit(:id, :email, :phone_number, :store_name, :your_name)
  end
  
end
