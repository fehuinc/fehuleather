class StaticController < ApplicationController
  def totem
    @totem_products = Product.totem_products
  end
  
  def locations
    @locations = Location.all
  end
  
  def events
    @events = Event.all
  end
  
  def err
  end
end
