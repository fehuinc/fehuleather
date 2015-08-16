class Api::TotemController < ApplicationController
  
  def index
    products = Product.all().includes(:stocks, variations: [:variants])
    json = products.to_json include: [:stocks, variations: {include: [:variants]}]
    render json: json
  end
  
end
