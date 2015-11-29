class Build < ActiveRecord::Base
  # ASSUMPTIONS
  ## Created/Destroyed by Stockhausen
  
  belongs_to :product
  has_many :parts, class_name: BuildPart # TODO: Create/Destroy in Stockhausen
  has_many :variants, through: :parts
  has_many :variations, through: :parts
  
  # TODO: Stockhausen should set each OrderItem's build to null when deleting
  # Then, on checkout, we check all OrderItems to make sure their build still exists.
  # If it doesn't we tell the user that this product build is no longer available.
  has_many :order_items
  
  validates :product, { presence: true }
  validates :stock, { numericality: { only_integer: true } }
  
  def name
    variants.map { |variant| variant.name }.reverse.append(product.name).join(" ")
  end
  
  def image(type)
    variantNames = variants.map do |variant|
      variant.name if variant.variation.has_image
    end.compact
    return Images.build_path(product.name, variantNames, type)
  end
  
  def price (wholesale = false)
    if wholesale
      price = product.price_wholesale
      variants.all.each { |variant| price += variant.price_wholesale }
      price.to_i
    else
      price = product.price_retail
      variants.all.each { |variant| price += variant.price_retail }
      price.to_i
    end
  end
end
