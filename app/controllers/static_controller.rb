class StaticController < ApplicationController
  def totem
    @totem_products = Product.totem_products.to_json include: [
      { variations: { include: :variants } },
      :configurations,
      :infos
    ]
    
    @shop_info = [
      { name: "Payment", content: "You can pay with your own blood!" },
      { name: "Shipping", content: "We don't actually use ships." },
      { name: "Returns", content: "The return statement lets you get data back out of a function." },
      { name: "Questions", content: "Answers" }
    ].to_json
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
