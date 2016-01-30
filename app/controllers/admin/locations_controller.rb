class Admin::LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def destroy
    render json: Location.find(params[:id]).destroy!
  end
end
