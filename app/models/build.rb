class Build < ActiveRecord::Base
  has_one :product, through: :variation # Will this work?
  belongs_to :variation
  belongs_to :size
  has_many :order_items
  
  validates :variation, :size, { presence: true }
  validates :stock, { numericality: { only_integer: true } }
  
  def full_name
    @full_name ||= "#{size.name} #{variation.name} #{product.name}"
  end
  
  def short_name
    @short_name ||= if variation.builds.count > 1
      full_name
    else
      "#{variation.name} #{product.name}"
    end
  end
  
  def price_retail
    variation.price_retail.fractional
  end
end
