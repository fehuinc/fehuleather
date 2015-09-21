class Configuration < ActiveRecord::Base
  # ASSUMPTIONS
  ## Created/Destroyed by Stockhausen

  belongs_to :product
  has_many :parts, class_name: ConfigurationPart # TODO: Create/Destroy in Stockhausen
  has_many :variants, through: :parts
  has_many :variations, through: :parts
  
  # TODO: Stockhausen should set each OrderItem's configuration to null when deleting
  # Then, on checkout, we check all OrderItems to make sure their configuration still exists.
  # If it doesn't we tell the user that this product configuration is no longer available.
  has_many :order_items
  
  validates :product, { presence: true }
  validates :stock, { numericality: { only_integer: true } }
  
  def image(type)
    variantNames = variants.map do |variant|
      variant.name if variant.variation.has_image
    end.compact
    return Images.build_path(product.name, variantNames, type)
  end
end
