class VariantStockJoin < ActiveRecord::Base
  belongs_to :variant
  belongs_to :stock, dependent: :delete
  
  validates :variant, :stock, presence: true
end
