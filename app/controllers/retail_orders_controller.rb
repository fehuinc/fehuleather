class RetailOrdersController < ApplicationController

  def show
    @order = RetailOrder.find_by_uuid(params[:id])
    @many = @order.items.count > 1 || @order.items.first.quantity > 1
  end

  def create
    # From Angular
    address_data = JSON.parse retail_order_params[:shippingAddress]
    email = retail_order_params[:email]
    notes = retail_order_params[:notes]

    # From JS
    token = retail_order_params[:token]
    amount_cents = retail_order_params[:amount_cents]
    quantity = retail_order_params[:quantity]
    currency = retail_order_params[:currency]
    builds_data = JSON.parse retail_order_params[:builds]
    builds = builds_data.map { |id, q| Build.find(id) }


    # Verify that we have items in the cart
    total_quantity = builds_data.keys.map(&:to_i).reduce(0, :+)
    raise CartEmptyError.new unless total_quantity > 0


    # Address for the RetailOrder
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

    # RetailOrder, to be saved if the charge succeeds
    order = RetailOrder.new(
      notes: notes,
      address: address
    )

    # OrderItems for our RetailOrder
    builds.each do |build|
      build_quantity = builds_data[build.id.to_s]

      raise StockChangedError.new if build_quantity > build.stock

      order.items.new(
        order: order, # must be specfied explicitly, because the association is polymorphic
        build: build,
        build_name: build.build_name,
        product_name: build.product.name,
        price: build.price_retail_render(currency),
        quantity: build_quantity
      )
    end


    # Verify that our prices on the client side match the server side
    real_amount = order.items.map(&:price).reduce(0, :+)
    real_amount = real_amount * 1.05 if currency == "CAD"
    raise PriceMismatchError.new unless amount_cents.to_i == real_amount.to_i


    # Initiate the real charge. Hold on to your butts!
    charge = Stripe::Charge.create(
      source: token,
      amount: amount_cents,
      description: "#{quantity} Item#{quantity == 1 ? "" : "s"} from Fehu Inc.",
      currency: currency
    )

    # The order succeeded!

    order.items.each { |item| item.build.stock -= item.quantity }
    order.payment_id = charge.id
    order.save!
    order.reload

    Mails.customer_retail_order(order).deliver_now
    Mails.admin_retail_order(order).deliver_now

    redirect_to order_complete_path(order)

  rescue CartEmptyError
    flash[:error] = "Purchase failed: Your cart is empty."
    redirect_to root_path

  rescue StockChangedError
    @builds = builds.to_json(only: [:id, :stock])
    render :stock_changed

  rescue PriceMismatchError
    flash[:error] = "Purchase failed: Price verification error. #{amount_cents} / #{real_amount}"
    redirect_to payment_path

  rescue Stripe::CardError => e
    flash[:error] = e.message # Todo: this is a crappy way to handle card errors
    redirect_to payment_path
  end

private

  def retail_order_params
    params.permit(:shippingAddress, :email, :notes, :token, :currency, :quantity, :amount_cents, :builds)
  end

end
