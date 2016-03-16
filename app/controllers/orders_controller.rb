class OrdersController < ApplicationController
  
  def create
    @token = order_params[:token]
    render :show
  end
  
private
  
  def order_params
    params.require(:order).permit(:token)
  end

end
