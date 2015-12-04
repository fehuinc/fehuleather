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
  
  def edit_product
    @merchant = Merchant.find(session[:merchant_id])
    @product = Product.find(params[:id])
    @order = @merchant.current_order
  end
  
  def update_product
    merchant = Merchant.find(session[:merchant_id])
    order = merchant.current_order
    builds = params[:builds]
    result = order.update_items builds
    render json: result
  end
  
  def checkout
    
  end

private
  
  def product_params
    params.require(:order)
  end

end
