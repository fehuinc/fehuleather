class RetailOrdersController < ApplicationController
  
  def show
    @order = RetailOrder.find_by_uuid(params[:id])
    @many = @order.items.count > 1 || @order.items.first.quantity > 1
  end
  
  def create
    notes = retail_order_params[:notes] # From Angular
    
    email = retail_order_params[:email] # From Angular
    address_data = JSON.parse retail_order_params[:shippingAddress] # From Angular
    
    address = Address.create!(
      name: address_data["name"],
      email: email,
      line1: address_data["address1"],
      line2: address_data["address2"],
      city: address_data["city"],
      code: address_data["postal"],
      region: address_data["provinceState"],
      country: address_data["country"]
    )
    
    order = RetailOrder.new(
      notes: notes,
      address: address
    )
    
    builds_data = JSON.parse retail_order_params[:builds] # From JS
    builds = builds_data.map { |id, q| Build.find(id) }
    currency = retail_order_params[:currency] # From JS
    
    builds.each do |build|
      order.items.new(
        order: order, # must be specfied explicitly, because the association is polymorphic
        build: build,
        build_name: build.build_name,
        product_name: build.product.name,
        price: build.price_retail(currency),
        quantity: builds_data[build.id.to_s]
      )
    end
    
    token = retail_order_params[:token] # From JS
    amount = builds.map(&:price_retail).reduce(0, :+) # In cents
    quantity = retail_order_params[:quantity] # From JS
    description = "#{quantity} Item#{quantity == 1 ? "" : "s"} from Fehu Inc."
    
    charge = Stripe::Charge.create(
      source: token,
      amount: amount,
      description: description,
      currency: currency
    )
    
    order.payment_id = charge.id
    
    order.save!
    order.reload
    
    # Email Freyja
    # Email the customer
    
    redirect_to order_path(order)
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to payment_path
  end
  
private
  
  def retail_order_params
    params.permit(:token, :builds, :shippingAddress, :email, :notes, :currency)
  end

end
