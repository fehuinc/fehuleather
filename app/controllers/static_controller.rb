class StaticController < ApplicationController
  def totem
    p = Product.where(show_retail: true).includes(:infos, { builds: :parts, variations: :variants })
    @totem_products = p.to_json include: [
      { variations: { include: :variants } },
      { builds: { include: :parts } },
      :infos
    ]
    
    # Todo: Make a full ActiveRecord model with these records?
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
    if Rails.env == "production"
      ExceptionNotifier.notify_exception(Exception.new, :env => request.env)
    end
  end
end
