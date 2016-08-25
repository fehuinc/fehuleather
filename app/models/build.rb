class Build < ApplicationRecord
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
  
  def price_wholesale_render(currency)
    variation.price_wholesale_render(currency)
  end
  
  def price_retail_render(currency)
    variation.price_retail_render(currency)
  end
  
  def retail_prices # -> Dollars
    p = variation.price_retail_raw
    return {
      CAD: p.as_ca_dollar.dollars.round,
      USD: p.as_us_dollar.dollars.round
    }
  end

  def wholesale_prices # -> Dollars
    p = variation.price_wholesale_raw
    return {
      CAD: p.as_ca_dollar.dollars.round,
      USD: p.as_us_dollar.dollars.round
    }
  end
end
