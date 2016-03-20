class Admin::OrdersController < ApplicationController
  def index
    @orders = (RetailOrder.all + WholesaleOrder.all).sort_by(&:created_at)
  end
end
