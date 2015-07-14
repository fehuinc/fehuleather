class Admin::VariantsController < ApplicationController
  def new
    @variation = Variation.find params[:variation_id]
    @variant = @variation.variants.new
    @product = @variation.product
  end
  
  def create
    @variation = Variation.find params[:variation_id]
    @variant = @variation.variants.new standard_params
    
    if @variant.valid?
      @variant = @variation.variants.create! standard_params
      flash[:notice] = @variant.name + " was successfully created!"
      redirect_to edit_admin_product_path @variation.product
    else
      render :new
    end
  
  rescue
    flash.now[:error] = "Something bad happened! Tell Ivan!"
    render :new
  end

  def edit
    @variant = Variant.find params[:id]
    @variation = @variant.variation
    @product = @variation.product
    variants = @variation.variants.order(:sort_order, :name)
    index = variants.index(@variant)
    @next = variants[(index+1)%variants.length]
    @prev = variants[(index-1+variants.length)%variants.length]
  end
  
  def update
    @variant = Variant.find params[:id]
    @variation = @variant.variation
    @product = @variation.product
    variants = @variation.variants.order(:sort_order, :name)
    index = variants.index(@variant)
    @next = variants[(index+1)%variants.length]
    @prev = variants[(index-1+variants.length)%variants.length]
    
    if @variant.update! standard_params
      flash[:notice] = "Saved"
      redirect_to edit_admin_product_path @product
    else
      flash.now[:error] = "Your hard effort was rejected! Poor hoo!"
      render :edit
    end
  end
  
  def destroy
    variant = Variant.find params[:id]
    success = variant.destroy!
    render json: success
  end
  
private
  
  def standard_params
    params.require(:variant).permit :default, :description, :name, :price_retail, :price_wholesale, :published, :show_retail, :show_wholesale, :sort_order
  end
end
