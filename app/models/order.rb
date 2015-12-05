class Order < ActiveRecord::Base
  # ASSUMPTIONS
  ## Orders are never deleted
  
  belongs_to :merchant # Optional — will be nil if this is a retail order
  has_many :items, class_name: OrderItem
  
  enum status: [:open, :submitted, :paid, :shipped] # WARNING: ENUM! APPEND ONLY!
  
  # TODO: What do I do to validate the enum?? Something like.... (?)
  # validates :status, { presence: true, numericality: { only_integer: true } }
  
  def item_for_build(build)
    items.where(build_id: build.id).first
  end
  
  def create_item_for_build(build, isWholesale)
    item = items.new build_id: build.id
    item.build = build
    item.name = build.name
    item.cents = isWholesale ? build.cents_wholesale : build.cents_retail
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
