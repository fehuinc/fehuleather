class WholesalesController < ApplicationController
  include MerchantAuth

  def index
    @merchant = Merchant.find(session[:merchant_id])
    @orders = @merchant.orders.where.not(submitted: nil).order(created_at: :desc)
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
    @products = Product.order(:name).select { |product| product.builds.any?(&:show_wholesale) }
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
    merchant = Merchant.find(session[:merchant_id])
    order = merchant.current_order
    order.orderInfo = wholesale_order_params[:orderInfo] # From Angular
    order.address = Address.find wholesale_order_params[:shippingAddressId] # From Angular
    order.submitted = Time.now
    order.save!
    merchant.current_order = nil
    merchant.save!
    OrderMailer.admin_wholesale_order(order).deliver_now
    redirect_to show_wholesale_path order
  end


  def show
    @order = WholesaleOrder.find_by_uuid(params[:id])
    @many = @order.items.count > 1 || @order.items.first.quantity > 1
  end


  def pay
    merchant = Merchant.find(session[:merchant_id])
    # order = setup_order merchant
    token = wholesale_order_params[:token] # From JS
    amount = order.subtotal("CAD").to_i # cents TODO: Add currency
    description = wholesale_order_params[:description] # From HTML
    currency = wholesale_order_params[:currency] # From Angular

    charge = Stripe::Charge.create(
      source: token,
      amount: amount,
      description: description,
      currency: currency
    )

    order.payment_id = charge.id
    order.paid = Time.now

    order.save!
    order.reload

    merchant.current_order = nil
    merchant.save!

    redirect_to show_wholesale_path(order)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to wholesale_checkout_path
  end


  def share
    email = params[:email]
    order = WholesaleOrder.find(params[:order_id])
    OrderMailer.customer_wholesale_order(email, order).deliver_now
    redirect_to show_wholesale_path(order), success: "Success"
  end


private


  def wholesale_order_params
    params.permit(:token, :shippingAddressId, :orderInfo, :currency, :description)
  end

end
