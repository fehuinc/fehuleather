class Variant < ActiveRecord::Base
  has_many :variant_stock_joins
  belongs_to :variation
  
  validates :description, :name, :variation, presence: true
  validates :price_retail, :price_wholesale, numericality: true
end
