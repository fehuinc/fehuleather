class Admin::VariationsController < ApplicationController
  def new
    @product = Product.find params[:product_id]
    @variation = @product.variations.new
  end
  
  def create
    @product = Product.find params[:product_id]
    @variation = @product.variations.new standard_params
    if @variation.save
      BuildMaker.make_build_pair(@variation, @variation.product.sizes)
      flash[:notice] = @variation.name + " was successfully created!"
      redirect_to edit_admin_product_path @product
    else
      render :new
    end
  end
  
  def edit
    @variation = Variation.includes(builds: [:size]).find(params[:id])
    @product = @variation.product
    variations = @product.variations.order(:name)
    index = variations.index(@variation)
    @next = variations[(index+1)%variations.length]
    @prev = variations[(index-1+variations.length)%variations.length]
  end
  
  def update
    @variation = Variation.includes(builds: [:size]).find(params[:id])
    @product = @variation.product
    variations = @product.variations.order(:name)
    index = variations.index(@variation)
    @next = variations[(index+1)%variations.length]
    @prev = variations[(index-1+variations.length)%variations.length]
    
    if @variation.update standard_params
      flash[:notice] = "Saved"
      redirect_to edit_admin_variation_path @variation
    else
      flash.now[:error] = "Your hard effort was rejected! Poor hoo!"
      render :edit
    end
  end
  
  def destroy
    render json: Variation.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:variation).permit :name, :model, :description, :totem_image, :wholesale_image, :adjust_retail, :adjust_wholesale
  end
end
