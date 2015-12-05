class OrderItem < ActiveRecord::Base
  # ASSUMPTIONS
  ## When an order is open, we use the associated build
  ## After an order is submitted, we only used the stored name and price
  
  belongs_to :order
  belongs_to :build
  
  validates :build_name, :order, :product_name, { presence: true }
  validates :cents, :quantity, { numericality: { only_integer: true } }
  
  def image(type)
    build.image(type)
  end
  
  def wholesale_image
    image 'wholesale'
  end
  
  def price
    cents.to_d / 100
  end
  
  def product
    build.product if build
  end
end
