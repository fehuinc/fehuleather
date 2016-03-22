class RetailOrdersController < ApplicationController
  
  def show
    @order = RetailOrder.find_by_uuid(params[:id])
  end
  
  def create
    notes = retail_order_params[:notes] # From Angular

    order = RetailOrder.new(
      notes: notes
    )
    
    email = retail_order_params[:email] # From Angular
    address = JSON.parse retail_order_params[:shippingAddress] # From Angular

    order.address.new(
      name: address.name,
      email: email,
      line1: address.line1,
      line2: address.line2,
      code: address.postal,
      region: address.province,
      country: address.country
    )

    builds_data = JSON.parse retail_order_params[:builds] # From JS
    builds = builds_data.map { |id, q| Build.find(id) }
    
    builds.each do |build|
      order.items.new(
        order: order, # must be specfied explicitly, because the association is polymorphic
        build: build,
        build_name: build.build_name,
        product_name: build.product.name,
        price: build.variation.price_retail,
        quantity: builds_data[build.id.to_s]
      )
    end
    
    token = retail_order_params[:token] # From JS
    amount = builds.map(&:price_retail).reduce(0, :+) # In cents
    quantity = retail_order_params[:quantity] # From JS
    description = "#{quantity} Item#{quantity == 1 ? "" : "s"} from Fehu Inc."
    currency = retail_order_params[:currency] # From JS
    
    charge = Stripe::Charge.create(
      source: token,
      amount: amount,
      description: description,
      currency: currency
    )
    
    order.transaction = charge.id
    
    order.save!
    order.reload
    
    # Email Freyja
    # Email the customer
    
    redirect_to retail_order_path(order)
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to payment_path
  end
  
private
  
  def retail_order_params
    params.permit(:token, :builds, :shippingAddress, :email, :notes)
  end

end
