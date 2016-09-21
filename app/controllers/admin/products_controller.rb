class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order(:name)
  end
  
  def new
    @product = Products.new
  end
  
  def create
    @product = Products.new standard_params
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
    @builds = @product.builds.includes(:variation, :size).sort_by { |b| b.build_name }
  end
  
  def update
    @product = Product.find params[:id]
    
    # These are all needed in case the update fails
    @variations = @product.variations.order(:name)
    @sizes = @product.sizes.order(:name)
    @infos = @product.infos.order(:name)
    @builds = @product.builds.includes(:variation, :size).sort_by { |b| b.build_name }
    
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
    params.require(:product).permit :name, :price_retail, :price_wholesale, :wholesale_description
  end

end
