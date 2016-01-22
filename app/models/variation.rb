class Variation < ActiveRecord::Base
  belongs_to :product
  has_many :builds
  
  validates :name, :product, { presence: true }
  
  monetize :price_retail_cents
  monetize :price_wholesale_cents
end
