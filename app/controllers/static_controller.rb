class StaticController < ApplicationController
  def totem
    @products = Product.totem_products
  end
  
  def err
  end
end
