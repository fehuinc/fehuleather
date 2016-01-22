class Admin::TotemItemsController < ApplicationController
  def new
    @totem_row = TotemRow.find(params[:totem_row_id])
    @totem_item = @totem_row.totem_items.new
    @product_builds = Build.all
  end
  
  def create
    @totem_row = TotemRow.find(params[:totem_row_id])
    @totem_item = @totem_row.totem_items.new(standard_params)
    @product_builds = Build.all
    if @totem_item.save
      flash[:success] = "Saved"
      redirect_to admin_totem_path
    else
      render :new
    end
  end
  
  def edit
    @totem_item = TotemItem.find(params[:id])
    @product_builds = Build.all
  end
  
  def update
    @totem_item = TotemItem.find(params[:id])
    @totem_item.update(standard_params)
    @product_builds = Build.all
    if @totem_item.save
      flash[:success] = "Saved"
      redirect_to admin_totem_path
    else
      render :edit
    end
  end
  
  def destroy
    @totem_item = TotemItem.find(params[:id])
    @totem_item.destroy
    redirect_to admin_totem_path
  end
  
private
  
  def standard_params
    params.require(:totem_item).permit(:name, :content, :image, :index, :build_id)
  end
end
