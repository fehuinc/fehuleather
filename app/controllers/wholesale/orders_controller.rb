class Wholesale::OrdersController < ApplicationController
  
  def edit
    @merchant = Merchant.find(session[:merchant_id])
    @kingdoms = Kingdom.all.order(:name)
  end
  
  def product
    @merchant = Merchant.find(session[:merchant_id])
    @product = Product.find(params[:id])
  end
  
end
