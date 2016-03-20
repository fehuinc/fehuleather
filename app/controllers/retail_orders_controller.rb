class RetailOrdersController < ApplicationController
  
  def show
    @order = RetailOrder.find(params[:id])
  end
  
  def create
    builds_data = JSON.parse retail_order_params[:builds] # From JS
    notes = retail_order_params[:notes] # From Angular
    quantity = retail_order_params[:quantity].to_i # From JS
    shippingAddress = JSON.parse retail_order_params[:shippingAddress] # From Angular
    token = retail_order_params[:token] # From JS
    
    builds = builds_data.map { |id, q| Build.find(id) }
    
    amount = builds.map(&:price_retail).reduce(0, :+) # In cents
    description = "#{quantity} Item #{quantity == 1 ? "" : "s"} from Fehu Inc."
    
    charge = Stripe::Charge.create(
      source: token,
      amount: amount,
      description: description,
      currency: "CAD"
    )
    
    retail_order = RetailOrder.new(
      notes: notes
    )
    
    builds.each do |build|
      retail_order.items.new(
        order: retail_order, # must be specfied explicitly, because the association is polymorphic
        build: build,
        build_name: build.build_name,
        product_name: build.product.name,
        price: build.variation.price_retail,
        quantity: builds_data[build.id.to_s]
      )
    end
    
    retail_order.save!
    
    # Email Freyja
    
    redirect_to retail_order_path(retail_order)
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to payment_path
  end
  
private
  
  def retail_order_params
    params.permit(:token, :builds, :shippingAddress, :notes)
  end

end
