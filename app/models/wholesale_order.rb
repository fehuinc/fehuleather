class WholesaleOrder < ApplicationRecord
  belongs_to :merchant
  belongs_to :address, optional: true
  has_many :items, as: :order, class_name: "OrderItem", dependent: :destroy

  def to_param
    uuid.parameterize
  end

  def subtotal(currency)
    items.map { |i| i.build.price_wholesale_render(currency) * i.quantity }.reduce(0, :+)
  end

  def item_for_build(build)
    items.where(build_id: build.id).first
  end

  def create_item_for_build(build, currency)
    item = items.new(
      build_id: build.id,
      build: build,
      build_name: build.build_name,
      product_name: build.product.name,
      #price: build.price_wholesale_render(currency) Should we do the price later, once we know the currency?
      quantity: 0
    )
    item.save!
    item
  end

  def update_item_from_build(build, quantity, currency)
    if quantity > 0
      item = item_for_build(build) || create_item_for_build(build, currency)
      item.quantity = quantity
      item.save! # Will error if this fails, which is what we want
      item.quantity
    else
      item = item_for_build(build)
      item.destroy! if item.present?
      0 # We now have 0 quantity
    end
  end

  def wholesale?
    true
  end

  def retail?
    false
  end

  def description
    "Wholesale Order of #{items.count} Item".pluralize(items.count)
  end
end
