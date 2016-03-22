class Admin::OrdersController < ApplicationController
  def index
    @orders_by_date = (RetailOrder.includes(:items) + WholesaleOrder.includes(:items)).sort_by(&:created_at).reverse.group_by do |order|
      order.created_at.to_time.strftime("%B %d, %Y")
    end
  end
end
