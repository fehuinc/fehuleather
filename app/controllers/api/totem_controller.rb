class Api::TotemController < ApplicationController
  
  def index
    json = Product.totem_products.to_json include: [:configurations, :infos, variations: {include: [:variants]}]
    render json: json
  end
  
end
