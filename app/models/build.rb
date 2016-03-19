class Build < ActiveRecord::Base
  has_one :product, through: :variation
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
  
  def build_name
    @short_name ||= if variation.builds.count > 1
      "#{size.name} #{variation.name}"
    else
      "#{variation.name}"
    end
  end
  
  def price_retail(currency = "CAD")
    variation.price_retail.exchange_to(currency).fractional
  end

  def retail_prices
    p = variation.price_retail
    return {
      "CAD" => p.fractional,
      "USD" => p.exchange_to("USD").fractional
    }
  end
end
