class Admin::OrdersController < ApplicationController
  def index
    retail = RetailOrder.includes(:items)
    wholesale = WholesaleOrder.includes(:items).where.not(address: nil)
    orders = retail + wholesale
    @orders_by_date = orders.sort_by(&:created_at)
                            .reverse
                            .group_by { |order| order.created_at.to_time.strftime("%B %d, %Y") }
  end
end
