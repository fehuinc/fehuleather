class Stock < ActiveRecord::Base
  has_many :variant_stock_joins
  has_many :variants, through: :variant_stock_joins
  has_many :variations, through: :variants
  belongs_to :product
  
  validates :product, presence: true
  validates :quantity, numericality: { only_integer: true }
end
