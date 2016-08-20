class WholesaleOrder < ApplicationRecord
  belongs_to :merchant
  belongs_to :address
  has_many :items, as: :order, class_name: OrderItem, dependent: :destroy

  def to_param
    uuid.parameterize
  end
  
  def subtotal
    items.map { |i| i.price.fractional * i.quantity }.reduce(0, :+)
  end
  
  def item_for_build(build)
    items.where(build_id: build.id).first
  end
  
  def create_item_for_build(build, isWholesale)
    item = items.new(
      build_id: build.id,
      build: build,
      build_name: build.build_name,
      product_name: build.product.name,
      price: isWholesale ? build.price_wholesale : build.price_retail,
      quantity: 0
    )
    item.save!
    item
  end
  
  def update_item_from_build(build, quantity, isWholesale)
    if quantity > 0
      item = item_for_build(build) || create_item_for_build(build, isWholesale)
      item.quantity = quantity
      item.save! # Will error if this fails, which is what we want
      item.quantity
    else
      item = item_for_build(build)
      item.destroy! if item.present?
      0 # We now have 0 quantity
    end
  end
end
