class RetailOrdersController < ApplicationController
  
  def show
    @order = RetailOrder.find_by_uuid(params[:id])
    @many = @order.items.count > 1 || @order.items.first.quantity > 1
  end
  
  def create
    notes = retail_order_params[:notes] # From Angular
    
    email = retail_order_params[:email] # From Angular
    address_data = JSON.parse retail_order_params[:shippingAddress] # From Angular
    
    address = Address.new(
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
    
    # If the cart is empty.. well.. let's just assume the stock changed?
    raise StockChangedError.new unless builds_data.keys.map(&:to_i).reduce(0, :+) > 0
    
    builds.each do |build|
      quantity = builds_data[build.id.to_s]
      
      raise StockChangedError.new if quantity > build.stock
      
      order.items.new(
        order: order, # must be specfied explicitly, because the association is polymorphic
        build: build,
        build_name: build.build_name,
        product_name: build.product.name,
        price: build.price_retail_render(currency),
        quantity: quantity
      )
    end
    
    token = retail_order_params[:token] # From JS
    amount = order.items.map(&:price).reduce(0, :+).to_i # In cents
    quantity = retail_order_params[:quantity] # From JS
    description = "#{quantity} Item#{quantity == 1 ? "" : "s"} from Fehu Inc."
    
    # Does this raise errors if it fails?
    charge = Stripe::Charge.create(
      source: token,
      amount: amount,
      description: description,
      currency: currency
    )
    
    order.payment_id = charge.id
    
    # By now, we're assuming the order is successful. We can now persist new stuff to the DB.

    order.items.each do |item|
      item.build.stock -= item.quantity
    end
    
    order.save!
    order.reload
    
    OrderMailer.customer_retail_order(order).deliver_now
    OrderMailer.admin_retail_order(order).deliver_now
    
    redirect_to order_complete_path(order)
  
  rescue StockChangedError
    @builds = builds.to_json(only: [:id, :stock])
    render :stock_changed
  
  rescue Stripe::CardError => e
    flash[:error] = e.message # Todo: this is a crappy way to handle card errors
    redirect_to payment_path
  end
  
private
  
  def retail_order_params
    params.permit(:token, :builds, :shippingAddress, :email, :notes, :currency)
  end

end
