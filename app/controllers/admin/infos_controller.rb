class Admin::InfosController < ApplicationController
  
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
      redirect_to edit_admin_info_path @info
    else
      render :new
    end
  
  # rescue
  #   flash.now[:error] = "Something bad happened! Tell Ivan!"
  #   render :new
  end

  def edit
    @info = Info.find params[:id]
    @product = @info.product
  end
  
  def update
    @info = Info.find params[:id]
    if @info.update! standard_params
      flash[:notice] = "Saved"
      redirect_to edit_admin_info_path @info
    else
      flash.now[:error] = "Your hard effort was rejected! Poor hoo!"
      render :edit
    end
  rescue
    flash.now[:error] = "Something bad happened! Tell Ivan!"
    render :edit
  end
  
  def destroy
    info = Info.find params[:id]
    success = info.destroy
    flash[:notice] = "Goodbye, #{info.name.titlecase}" if success
    render json: success
  end

private
  
  def standard_params
    params.require(:info).permit :name, :content
  end
end
