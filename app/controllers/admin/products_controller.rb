class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def new
  end
  
  def edit
  end
end
