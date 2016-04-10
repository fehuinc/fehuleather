class Variation < ActiveRecord::Base
  belongs_to :product
  has_many :builds, dependent: :destroy
  has_many :totem_items, dependent: :destroy
  
  validates :name, :product, { presence: true }
  
  monetize :adjust_retail_cents
  monetize :adjust_wholesale_cents
  
  def price_retail(currency = "CAD")
    (product.price_retail + adjust_retail).exchange_to(currency).fractional
  end
  
  def price_wholesale(currency = "CAD")
    (product.price_wholesale + adjust_wholesale).exchange_to(currency).fractional
  end
  
  def full_name
    @full_name ||= "#{name} #{product.name}"
  end
  
  def show_wholesale
    builds.where(show_wholesale: true).any?
  end
end
