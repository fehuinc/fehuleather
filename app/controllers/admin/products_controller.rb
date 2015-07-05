class Admin::ProductsController < ApplicationController
  def index
    @products = Genus.all
  end
end
