class Stock < ActiveRecord::Base
  has_many :variant_stock_joins
  has_many :variants, through: :variant_stock_joins
  has_many :variations, through: :variants
  belongs_to :product
  
  validates :product, presence: true
  validates :quantity, numericality: { only_integer: true }
  
  def image(type)
    variants.map do |variant|
      variant.name if variant.variation.has_image
    end.compact
       .join("-")
       .prepend("#{product.name}/")
       .downcase
       .gsub('&', 'and')
       .gsub(/[^0-9a-z\-]/, ' ')
       .gsub(/\s+/, '-')
       .concat(".jpg")
       .prepend("#{type}/")
       .prepend(ENV["IMAGEPATH"])
  end
end
