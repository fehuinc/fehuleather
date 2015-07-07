class Variant < ActiveRecord::Base
  has_many :variant_stock_joins
  belongs_to :variation
  
  validates :default, :description, :name, :price_retail, :price_wholesale, :published, :show_retail, :show_wholesale, :variation, presence: true
  validates :price_retail, :price_wholesale, numericality: true
end
