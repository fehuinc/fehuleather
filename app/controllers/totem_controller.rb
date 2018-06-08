class TotemController < ApplicationController
  
  def index
    @totem_rows = TotemRow.includes(items: [:product, variation: [builds: [:size, :variation, :product]]]).order(:index)
  end

end
