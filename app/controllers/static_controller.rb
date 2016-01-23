class StaticController < ApplicationController
  def totem
    @totem_rows = TotemRow.includes(:items)
  end
  
  def locations
    @locations = Location.all
  end
  
  def events
    @events = Event.all
  end
  
  def not_found
    if Rails.env == "production"
      ExceptionNotifier.notify_exception(Exception.new("404: #{request.original_fullpath}"), env: request.env)
    end
    render :err, status: 404
  end
end
