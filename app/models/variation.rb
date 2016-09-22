class Variation < ApplicationRecord
  belongs_to :product
  has_many :builds, dependent: :destroy
  has_many :totem_items, dependent: :destroy
  
  validates :name, :product, { presence: true }
  
  monetize :adjust_retail_cents
  monetize :adjust_wholesale_cents
  
  def price_retail_raw
    product.price_retail + adjust_retail
  end
  
  def price_wholesale_raw
    product.price_wholesale + adjust_wholesale
  end
  
  def price_retail_render(currency)
    price_retail_raw.exchange_to(currency).fractional
  end
  
  def price_wholesale_render(currency)
    price_wholesale_raw.exchange_to(currency).fractional
  end
  
  def full_name
    @full_name ||= "#{name} #{product.name}"
  end
  
  def list_name
    @list_name ||= "#{product.name} · #{name}"
  end
  
  def show_wholesale
    builds.where(show_wholesale: true).any?
  end
  
  def sold_out
    !builds.any? { |b| b.stock > 0 }
  end
  
  def totem_builds_js
    self.where(show_retail: true).map { |build| js_build_elm(build) }.join("\n")
  end
end
