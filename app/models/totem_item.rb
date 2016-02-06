class TotemItem < ActiveRecord::Base
  belongs_to :row, class_name: "TotemRow", inverse_of: :items
  belongs_to :variation
  
  validates :index, :ypos, { numericality: { only_integer: true } }
  
  def real_name
    variation_id ? variation.full_name : name
  end
  
  def real_image
    variation_id ? variation.totem_image : image
  end
end
