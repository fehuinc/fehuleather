class StaticController < ApplicationController
  around_action :skip_bullet, only: :totem

  def totem
    @totem_rows = TotemRow.includes(items: [product: [:infos], variation: [builds: [:size, :variation, :product]]]).order(:index)
  end
  
  def payment
    
  end
  
  def locations
    @locations = Location.all.order(:country, :province, :name)
  end
  
  def events
    @events = Event.all
  end

  def not_found
    if Rails.env == "production" and !ExceptionBlacklist.path_on_404_blacklist(request.original_fullpath)
      ExceptionNotifier.notify_exception(Exception.new("404: #{request.original_fullpath}"), env: request.env)
    end
    render :err, status: 404
  end

  def robots
    if ENV['NO_ROBOTS'] == "true"
      render plain: "User-agent: *\nDisallow: /\n"
    else
      render plain: "User-agent: *\nDisallow:\n"
    end
  end
end
