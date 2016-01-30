class Admin::ProductInfosController < ApplicationController
  
  def new
    @product = Product.find params[:product_id]
    @info = @product.infos.new
  end
  
  def create
    @product = Product.find params[:product_id]
    @info = @product.infos.new standard_params
    
    if @info.valid?
      @info = @product.infos.create! standard_params
      flash[:notice] = "Saved"
      redirect_to edit_admin_product_path @product
    else
      render :new
    end
  end

  def edit
    @info = ProductInfo.find params[:id]
    @product = @info.product
  end
  
  def update
    @info = ProductInfo.find params[:id]
    if @info.update! standard_params
      flash[:notice] = "Saved"
      redirect_to edit_admin_product_path @info.product
    else
      flash.now[:error] = "Your hard effort was rejected! Poor hoo!"
      render :edit
    end
  end
  
  def destroy
    render json: ProductInfo.find(params[:id]).destroy!
  end

private
  
  def standard_params
    params.require(:product_info).permit :name, :content
  end
end
