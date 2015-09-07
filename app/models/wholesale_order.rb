class WholesaleOrder < ActiveRecord::Base
  has_many :wholesale_order_items
  belongs_to :merchant
end
