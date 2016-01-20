class StaticController < ApplicationController
  def totem
    @totem_products = Product.where(show_retail: true).includes(:infos, { builds: :parts, variations: :variants })
    
    # # Todo: Make a full ActiveRecord model with these records?
    @shop_info = [
      { name: "Payment", content: "You can pay with your own blood!" },
      { name: "Shipping", content: "We don't actually use ships." },
      { name: "Returns", content: "The return statement lets you get data back out of a function." },
      { name: "Questions", content: "Answers" }
    ]
  end
  
  def locations
    @locations = Location.all
  end
  
  def events
    @events = Event.all
  end
  
  def cause_an_error
    raise "My Organs!"
  end
  
  def err
    if Rails.env == "production"
      ExceptionNotifier.notify_exception(Exception.new("404: #{request.original_fullpath}"), :env => request.env)
    end
  end
end
