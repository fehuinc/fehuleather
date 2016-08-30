class WholesalesController < ApplicationController
  
  def index
    @merchant = Merchant.find(session[:merchant_id])
    @orders_by_date = @merchant.orders.includes(:items).sort_by(&:created_at).reverse.group_by do |order|
      order.created_at.to_time.strftime("%B %d, %Y")
    end
  end
  
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
    @kingdoms = Kingdom.order(:name).select { |kingdom|
      kingdom.products.any? { |product|
        product.builds.any?(&:show_wholesale)
      }
    }
  end
  
  
  def edit_product
    @merchant = Merchant.find(session[:merchant_id])
    @order = @merchant.current_order
    @product = Product.includes(variations: [builds: [:size, :variation, :product]]).find(params[:id])
  end
  
  
  def update_order
    merchant = Merchant.find session[:merchant_id]
    order = merchant.current_order
    build = Build.find params[:build_id]
    currency = nil # Temporarily disabled
    result = order.update_item_from_build build, params[:quantity], currency
    render json: result
  end
  
  
  def checkout
    @merchant = Merchant.includes(current_order: [items: [build: [:variation]]]).find session[:merchant_id]
    @order = @merchant.current_order
    @subtotal = @order.subtotal("CAD").to_i # TODO: Add currency
    @items_count = @order.items.map(&:quantity).reduce(&:+)
  end
  
  
  def submit
    @merchant = Merchant.find(session[:merchant_id])
    @order = @merchant.current_order
    
    @order.notes = notes = wholesale_order_params[:notes] # From Angular
    @order.address = Address.find wholesale_order_params[:shippingAddressId] # From Angular
    
    token = wholesale_order_params[:token] # From JS
    amount = @order.subtotal("CAD").to_i # cents TODO: Add currency
    description = wholesale_order_params[:description] # From HTML
    currency = wholesale_order_params[:currency] # From Angular
    
    charge = Stripe::Charge.create(
      source: token,
      amount: amount,
      description: description,
      currency: currency
    )
    
    @order.payment_id = charge.id
    
    @order.submitted = Time.now
    @order.paid = Time.now
    
    @order.save!
    @order.reload
    
    @merchant.current_order = nil
    @merchant.save!
    
    # Email Freyja
    # Email the customer
    
    redirect_to show_wholesale_path(@order)
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to wholesale_checkout_path
  end
  
  
  def show
    @order = WholesaleOrder.find_by_uuid(params[:id])
    @many = @order.items.count > 1 || @order.items.first.quantity > 1
  end
  
private
  
  def wholesale_order_params
    params.permit(:token, :shippingAddressId, :notes, :currency, :description)
  end
  
end
