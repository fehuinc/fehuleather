class OrderItem < ActiveRecord::Base
  # ASSUMPTIONS
  ## When an order is open, we use the associated Configuration
  ## After an order is submitted, we only used the stored name and price
  
  belongs_to :order
  has_one :configuration
  
  validates :name, :order, { presence: true }
  validates :cents, :quantity, { numericality: { only_integer: true } }
end
