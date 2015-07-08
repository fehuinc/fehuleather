class Admin::ProductsController < ApplicationController
  def index
    @kingdoms = Kingdom.all
  end
  
  def new
    @kingdom = Kingdom.find params[:kingdom_id]
    @product = @kingdom.products.new
  end
  
  def create
    @kingdom = Kingdom.find params[:kingdom_id]
    @product = @kingdom.products.new standard_params
    
    if @product.valid?
      @product = @kingdom.products.create! standard_params
      flash[:notice] = "Saved"
      redirect_to admin_products_path
    else
      render :new
    end
  
  rescue
    flash.now[:error] = "Something bad happened! Tell Ivan!"
    @kingdom = Kingdom.find params[:kingdom_id]
    @product = @kingdom.products.new standard_params
    render :new
  end

private
  
  def standard_params
    params.require(:product).permit :description, :name, :price_retail, :price_wholesale, :published, :show_retail, :show_wholesale
  end

end
