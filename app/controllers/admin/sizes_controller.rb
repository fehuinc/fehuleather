class Admin::SizesController < ApplicationController
  def new
    @product = Product.find params[:product_id]
    @size = @product.sizes.new
  end
  
  def create
    @product = Product.find params[:product_id]
    @size = @product.sizes.new standard_params
    if @size.save
      BuildMaker.make_build_pair(@size, @size.product.variations)
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
    render json: Size.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:size).permit :name
  end

end
