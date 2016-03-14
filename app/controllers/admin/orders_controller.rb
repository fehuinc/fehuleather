class Admin::OrdersController < ApplicationController
  
  def create
    
  end
  
  def destroy
    render json: Order.find(params[:id]).destroy!
  end

private
  
  def login_params
    params.fetch(:merchant, {}).permit(:email)
  end

end
