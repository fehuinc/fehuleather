class Admin::OrdersController < ApplicationController
  def destroy
    render json: Order.find(params[:id]).destroy!
  end
end
