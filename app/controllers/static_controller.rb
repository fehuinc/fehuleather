class StaticController < ApplicationController
  def totem
    @products = Product.totem_products
    
    @totem_images = {}
    @products.each do |product|
      @totem_images[product.name] = product.totem_images
    end
    
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
