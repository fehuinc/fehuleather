class Admin::TotemRowsController < ApplicationController
  def index
    @totem_rows = TotemRow.includes(items: [{variation: [:product]}]).order(:index)
  end

  def new
    @totem_row = TotemRow.new(index: TotemRow.count)
  end
  
  def create
    @totem_row = TotemRow.new(standard_params)
    if @totem_row.save
      flash[:success] = "Saved"
      redirect_to admin_totem_path
    else
      render :new
    end
  end
  
  def edit
    @totem_row = TotemRow.find(params[:id])
  end
  
  def update
    @totem_row = TotemRow.find(params[:id])
    @totem_row.update(standard_params)
    if @totem_row.save
      flash[:success] = "Saved"
      redirect_to admin_totem_path
    else
      render :edit
    end
  end
  
  def destroy
    render json: TotemRow.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:totem_row).permit(:index)
  end
end
