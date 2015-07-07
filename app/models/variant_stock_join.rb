class VariantStockJoin < ActiveRecord::Base
  belongs_to :variant
  belongs_to :stock
  
  validates :variant, :stock, presence: true
end
