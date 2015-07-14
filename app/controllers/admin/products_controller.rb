class Admin::ProductsController < ApplicationController
  def new
    @kingdom = Kingdom.find params[:kingdom_id]
    @product = @kingdom.products.new
  end
  
  def create
    @kingdom = Kingdom.find params[:kingdom_id]
    @product = @kingdom.products.new standard_params
    
    if @product.valid?
      @kingdom.products.create! standard_params
      flash[:notice] = "Saved"
      redirect_to admin_kingdoms_path
    else
      render :new
    end
  
  rescue
    flash.now[:error] = "Something bad happened! Tell Ivan!"
    render :new
  end
  
  def edit
    @product = Product.find params[:id]
    @stocks = @product.stocks
  end
  
  def update
    @product = Product.find params[:id]
    if @product.update! standard_params
      flash[:notice] = "Saved"
      redirect_to edit_admin_product_path @product
    else
      flash.now[:error] = "Your hard effort was rejected! Poor hoo!"
      render :edit
    end
  end
  
  def destroy
    product = Product.find params[:id]
    success = product.destroy!
    flash[:notice] = "Goodbye, #{product.name.titlecase}"
    render json: success
  end
  
  def preview_images
    @product = Product.find params[:id]
  end
  
private
  
  def standard_params
    params.require(:product).permit :description, :name, :price_retail, :price_wholesale, :published, :show_retail, :show_wholesale
  end

end
