class StaticController < ApplicationController
  def totem
    @totem_rows = TotemRow.includes(items: [variation: [product: [:sizes]]]).order(:index)
  end
  
  def locations
    @locations = Location.all.order(:country, :province, :name)
  end
  
  def events
    @events = Event.all.order(:index)
  end
  
  def not_found
    if Rails.env == "production"
      ExceptionNotifier.notify_exception(Exception.new("404: #{request.original_fullpath}"), env: request.env)
    end
    render :err, status: 404
  end
end
