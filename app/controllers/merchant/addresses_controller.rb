class Merchant::AddressesController < ApplicationController
  def new
    merchant = Merchant.find(session[:merchant_id])
    @address = merchant.addresses.new
  end
  
  def create
    merchant = Merchant.find(session[:merchant_id])
    @address = merchant.addresses.new address_params
    
    if @address.save
      redirect_to checkout_wholesale_path
    else
      render :new
    end
  end
  
  def edit
    merchant = Merchant.find(session[:merchant_id])
    @address = merchant.addresses.find(params[:id])
  end
  
  def update
    merchant = Merchant.find(session[:merchant_id])
    @address = merchant.addresses.find(params[:id])

    if @address.update(address_params)
      redirect_to checkout_wholesale_path
    else
      render :edit
    end
  end

  def destroy
    merchant = Merchant.find(session[:merchant_id])
    address = merchant.addresses.find(params[:id])
    render json: address.destroy!
  end
  
private

  def address_params
    params.require(:address).permit(:name, :email, :line1, :line2, :city, :region, :code, :country)
  end

end
