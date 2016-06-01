class Admin::EventsController < ApplicationController
  def index
    @events = Event.all.order(:date)
  end
  
  def new
    @model = Event.new
  end
  
  def create
    @model = Event.new(standard_params)
    if @model.save
      redirect_to admin_events_path
    else
      render :new
    end
  end
  
  def edit
    @model = Event.find(params[:id])
  end
  
  def update
    if @model = Event.find(params[:id]).update(standard_params)
      redirect_to admin_events_path
    else
      render :edit
    end
  end
  
  def destroy
    render json: Event.find(params[:id]).destroy!
  end
  
private
  
  def standard_params
    params.require(:event).permit :name, :date, :location, :webite, :description
  end
  
end
