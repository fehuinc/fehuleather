class Admin::SizesController < ApplicationController
  def new
    @product = Product.find params[:product_id]
    @size = @product.sizes.new
  end
  
  def create
    @product = Product.find params[:product_id]
    @size = @product.sizes.new standard_params
    if @size.save
      BuildMaker.new_size(@product, size)
      flash[:notice] = "Saved"
      redirect_to edit_admin_product_path(@product)
    else
      render :new
    end
  end
  
  def edit
    @size = Size.find params[:id]
  end
  
  def update
    @size = Size.find params[:id]
    if @size.update! standard_params
      flash[:notice] = "Saved"
      redirect_to edit_admin_product_path @size.product
    else
      flash.now[:error] = "Your hard effort was rejected! Poor hoo!"
      render :edit
    end
  end
  
  def destroy
    size = Size.find params[:id]
    success = size.destroy
    flash[:notice] = "Goodbye, #{size.name}" if success
    render json: success
  end
  
private
  
  def standard_params
    params.require(:size).permit :name
  end

end
