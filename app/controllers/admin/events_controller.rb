class Admin::EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def destroy
    render json: Event.find(params[:id]).destroy!
  end
end
