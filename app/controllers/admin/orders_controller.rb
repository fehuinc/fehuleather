class Admin::OrdersController < ApplicationController
  def index
    retail = RetailOrder.includes(:items).group_by { |order| order.created_at.strftime("%B %d, %Y") }
    wholesale = WholesaleOrder.includes(:items).where.not(address: nil).group_by { |order| order.submitted.strftime("%B %d, %Y") }
    @orders_by_date = retail.merge(wholesale) {|k, a, b| a + b }
  end

  def accept
    order = WholesaleOrder.find(params[:id])
    order.accepted = Time.now
    if order.save
      Mails.wholesale_order_accepted(order).deliver_now
      redirect_to admin_orders_path
    else
      redirect_to admin_orders_path, notice: order.errors.full_messages.first
    end
  end

  def ship
    is_wholesale = params[:wholesale] == "true"
    order = (is_wholesale ? WholesaleOrder : RetailOrder).find(params[:id])

    order.shipped = Time.now
    order.tracking_number = params[:tracking_number]
    if order.save

      # TODO: Email confirmation for shipped retail orders
      (is_wholesale ? Mails.wholesale_order_shipped(order) : nil).deliver_now

      redirect_to admin_orders_path
    else
      redirect_to admin_orders_path, notice: order.errors.full_messages.first
    end
  end
end
