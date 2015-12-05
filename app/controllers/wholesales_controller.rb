class WholesalesController < ApplicationController
  
  def new
    merchant = Merchant.find(session[:merchant_id])
    if merchant.current_order.nil?
      merchant.current_order = merchant.orders.create!
      merchant.save!
    end
    redirect_to edit_wholesale_path
  end
  
  
  def edit
    @merchant = Merchant.find(session[:merchant_id])
    @kingdoms = Kingdom.all.joins(:products).where(products: { show_wholesale: true }).order(:name)
  end
  
  
  def edit_product
    @merchant = Merchant.find(session[:merchant_id])
    @product = Product.find(params[:id])
    @builds = @product.builds.joins(:variants).where(variants: { show_wholesale: true })
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
  
end
