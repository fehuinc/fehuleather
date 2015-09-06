class Wholesale::OrdersController < ApplicationController
  
  def edit
    @merchant = Merchant.find(session[:merchant_id])
    @kingdoms = Kingdom.all.order(:name)
  end
  
end
