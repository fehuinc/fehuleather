class Admin::TotemItemsController < ApplicationController
  def new
    @totem_row = TotemRow.find(params[:totem_row_id])
    @totem_item = @totem_row.items.new
    @select_variations = select_variations
  end
  
  def create
    @totem_row = TotemRow.find(params[:totem_row_id])
    @totem_item = @totem_row.items.new(standard_params)
    @select_variations = select_variations
    if @totem_item.save
      flash[:success] = "Saved"
      redirect_to admin_totem_path
    else
      render :new
    end
  end
  
  def edit
    @totem_item = TotemItem.find(params[:id])
    @select_variations = select_variations
  end
  
  def update
    @totem_item = TotemItem.find(params[:id])
    @totem_item.update(standard_params)
    @select_variations = select_variations
    if @totem_item.save
      flash[:success] = "Saved"
      redirect_to admin_totem_path
    else
      render :edit
    end
  end
  
  def destroy
    render json: TotemItem.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:totem_item).permit(:name, :content, :image, :index, :variation_id)
  end
  
  def select_variations
    [[nil, "None"]].concat Variation.includes(:product).select { |variation|
      variation.product.sizes.any? # This avoids an error if you forget to add a size to the product
    }.map { |g| [g.id, g.full_name] }
  end
end
