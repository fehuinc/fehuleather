class VariantStockJoin < ActiveRecord::Base
  belongs_to :variant, dependent: :destroy
  belongs_to :stock, dependent: :destroy
  
  validates :variant, :stock, presence: true
end
