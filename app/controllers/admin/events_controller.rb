class Admin::EventsController < ApplicationController
  def index
    @events = Event.order(updated_at: :desc)
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
    @model = Event.find(params[:id])
    if @model.update(standard_params)
      @model.touch
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
    params.require(:event).permit :name, :date, :location, :website, :description
  end
  
end
