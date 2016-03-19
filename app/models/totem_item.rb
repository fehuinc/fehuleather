class TotemItem < ActiveRecord::Base
  belongs_to :row, class_name: "TotemRow", inverse_of: :items
  belongs_to :variation
  has_one :product, through: :variation
  
  validates :index, { numericality: { only_integer: true } }
  
  def is_product
    variation_id.present?
  end
  
  def real_name
    variation_id ? variation.product.name : name
  end
  
  def real_image
    variation_id ? variation.totem_image : image
  end
end
