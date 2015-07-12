class Admin::KingdomsController < ApplicationController
  def index
    @kingdoms = Kingdom.all
  end
  
  def new
    @kingdom = Kingdom.new
  end
  
  def create
    @kingdom = Kingdom.new standard_params
    
    if @kingdom.valid?
      Kingdom.create! standard_params
      flash[:notice] = "Saved"
      redirect_to :kingdom_index
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
  
private
  
  def standard_params
    params.require(:kingdom).permit :name
  end
end
