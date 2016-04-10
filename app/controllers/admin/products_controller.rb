class Admin::ProductsController < ApplicationController
  def new
    @kingdom = Kingdom.find params[:kingdom_id]
    @product = @kingdom.products.new
  end
  
  def create
    @kingdom = Kingdom.find params[:kingdom_id]
    @product = @kingdom.products.new standard_params
    if @product.save
      flash[:notice] = "Saved"
      redirect_to edit_admin_product_path(@product)
    else
      render :new
    end
  end
  
  def edit
    @product = Product.find params[:id]
    @variations = @product.variations.order(:name)
    @sizes = @product.sizes.order(:name)
    @infos = @product.infos.order(:name)
    @builds = @product.builds.includes(:variation).sort_by { |b| b.build_name }
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
  rescue
    flash.now[:error] = "Something bad happened! Tell Ivan!"
    render :edit
  end
  
  def destroy
    render json: Product.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:product).permit :name, :price_retail, :price_wholesale, :made_to_order
  end

end
