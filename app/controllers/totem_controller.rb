class TotemController < ApplicationController
  around_action :skip_bullet, only: :index
  
  def index
    @totem_rows = TotemRow.includes(items: [:product, variation: [builds: [:size, :variation, :product]]]).order(:index)
  end
  
end
