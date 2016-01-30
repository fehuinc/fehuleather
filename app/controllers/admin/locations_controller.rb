class Admin::LocationsController < ApplicationController
  def index
    @locations = Location.all.order(:country, :province, :name)
  end
  
  def new
    @model = Location.new
  end
  
  def create
    @model = Location.new(standard_params)
    if @model.save
      redirect_to admin_locations_path
    else
      render :new
    end
  end
  
  def edit
    @model = Location.find(params[:id])
  end
  
  def update
    if @model = Location.find(params[:id]).update(standard_params)
      redirect_to admin_locations_path
    else
      render :edit
    end
  end
  
  def destroy
    render json: Location.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:location).permit :name, :url, :phone, :address, :city, :province, :postal, :country
  end
end
