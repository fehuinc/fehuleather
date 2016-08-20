class RetailOrder < ApplicationRecord
  belongs_to :address
  has_many :items, as: :order, class_name: OrderItem, dependent: :destroy
  
  def to_param
    uuid.parameterize
  end
  
  # def item_for_build(build)
  #   items.where(build_id: build.id).first
  # end
  #
  # def create_item_for_build(build, isWholesale)
  #   item = items.new build_id: build.id
  #   item.build = build
  #   item.build_name = build.build_name
  #   item.product_name = build.product.name
  #   item.cents = isWholesale ? build.price_wholesale : build.price_retail
  #   item.save!
  #   item
  # end
  #
  # def update_item_from_build(build, quantity, isWholesale)
  #   if quantity > 0
  #     item = item_for_build(build) || create_item_for_build(build, isWholesale)
  #     item.quantity = quantity
  #     item.save! # Will error if this fails, which is what we want
  #     item.quantity
  #   else
  #     item = item_for_build(build)
  #     item.destroy! if item.present?
  #     0 # We now have 0 quantity
  #   end
  # end
end
