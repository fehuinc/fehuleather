class OrdersController < ApplicationController
  
  def create
    @token = order_params[:token]
    render :show
  end
  
private
  
  def order_params
    params.permit(:token)
  end

end
