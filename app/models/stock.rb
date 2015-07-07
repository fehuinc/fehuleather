class Stock < ActiveRecord::Base
  has_many :variant_stock_joins
  belongs_to :product
  
  validates :product, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
end
