class Admin::KingdomsController < ApplicationController
  def index
    @kingdoms = Kingdom.all.order(:name)
  end
  
  def new
    @kingdom = Kingdom.new
  end
  
  def create
    @kingdom = Kingdom.new standard_params
    
    if @kingdom.valid?
      Kingdom.create! standard_params
      flash[:notice] = "Saved"
      redirect_to :admin_kingdoms
    else
      render :new
    end
  
  rescue
    flash.now[:error] = "Something bad happened! Tell Ivan!"
    render :new
  end
  
  def update
    @kingdom = Kingdom.find(params[:id])
    success = @kingdom.update!(standard_params)
    render json: success
  end

  def destroy
    render json: Kingdom.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:kingdom).permit :name
  end
end
