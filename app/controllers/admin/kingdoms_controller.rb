class Admin::KingdomsController < ApplicationController
  def new
    @kingdom = Kingdom.new
  end
  
  def create
    @kingdom = Kingdom.new standard_params
    
    if @kingdom.valid?
      @kingdom = Kingdom.create! standard_params
      flash[:notice] = "Saved"
      redirect_to admin_products_path
    else
      render :new
    end
  
  rescue
    flash.now[:error] = "Something bad happened! Tell Ivan!"
    @kingdom = Kingdom.new standard_params
    render :new
  end
  
private
  
  def standard_params
    params.require(:kingdom).permit :name
  end
end
