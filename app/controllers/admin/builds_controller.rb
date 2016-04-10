class Admin::ProductsController < ApplicationController
  def update_stock
    build = Build.find params[:id]
    build.stock = params[:quantity]
    success = build.save
    render json: success
  end
end
