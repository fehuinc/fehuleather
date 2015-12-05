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
  
  def name # TODO: rename to "full_name"
    "#{build_name} #{product.name}"
  end
  
  def build_name
    # TODO: I should precompute this and store it in the DB
    variants.map(&:name).reverse.join(" ")
  end
  
  def image(type)
    variantNames = variants.map do |variant|
      variant.name if variant.variation.has_image
    end.compact
    return Images.build_path(product.name, variantNames, type)
  end
  
  def cents_retail
    cents = product.cents_retail
    variants.all.each { |variant| cents += variant.cents_retail }
    cents
  end

  def cents_wholesale
    cents = product.cents_wholesale
    variants.all.each { |variant| cents += variant.cents_wholesale }
    cents
  end
end
