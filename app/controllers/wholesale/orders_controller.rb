class Wholesale::OrdersController < ApplicationController
  
  def new
    merchant = Merchant.find(session[:merchant_id])
    if merchant.current_order.nil?
      merchant.current_order = merchant.orders.create!
      merchant.save!
    end
    redirect_to edit_wholesale_order_path
  end
  
  def edit
    @merchant = Merchant.find(session[:merchant_id])
    @kingdoms = Kingdom.all.order(:name)
  end
  
  def product
    @merchant = Merchant.find(session[:merchant_id])
    @product = Product.find(params[:id])
  end
  
end
