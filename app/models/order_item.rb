class OrderItem < ApplicationRecord
  # ASSUMPTIONS
  ## When an order is open, we use the associated build
  ## After an order is submitted, we only used the stored name and price
  
  belongs_to :order, polymorphic: true
  belongs_to :build
  
  validates :order, :build_name, :product_name, :price, :quantity, { presence: true }
  validates :quantity, { numericality: { only_integer: true } }
  
  monetize :price_cents
end
