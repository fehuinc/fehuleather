class OrderItem < ActiveRecord::Base
  # ASSUMPTIONS
  ## When an order is open, we use the associated Configuration
  ## After an order is submitted, we only used the stored name and price
  
  belongs_to :order
  belongs_to :configuration
  
  validates :name, :order, { presence: true }
  validates :cents, :quantity, { numericality: { only_integer: true } }
  
  def image(type)
    configuration.image(type)
  end
  
  def price
    cents.to_d / 100
  end
  
  def product
    configuration.product if configuration
  end
end
