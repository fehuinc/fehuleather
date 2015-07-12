class Admin::VariationsController < ApplicationController
  def new
    @product = Product.find params[:product_id]
    @variation = @product.variations.new
  end
  
  def create
    @product = Product.find params[:product_id]
    @variation = @product.variations.new standard_params
    
    if @variation.valid?
      @variation = @product.variations.create! standard_params
      flash[:notice] = @variation.name + " was successfully created!"
      redirect_to edit_admin_product_path @product
    else
      render :new
    end
  
  rescue
    flash.now[:error] = "Something bad happened! Tell Ivan!"
    render :new
  end
  
  def update
    @variation = Variation.find(params[:id])
    success = @variation.update!(standard_params)
    render json: success
  end
  
private
  
  def standard_params
    params.require(:variation).permit :description, :has_image, :level, :name
  end
end
