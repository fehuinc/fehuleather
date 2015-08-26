class Api::TotemController < ApplicationController
  
  def index
    products = Product.all().includes(:stocks, :infos, variations: [:variants])
    json = products.to_json include: [:stocks, :infos, variations: {include: [:variants]}]
    render json: json
  end
  
end
