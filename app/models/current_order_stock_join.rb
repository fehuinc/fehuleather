class CurrentOrderStockJoin < ActiveRecord::Base
  belongs_to :current_order, dependent: :delete
  belongs_to :stock, dependent: :delete
  
  validates :current_order, :stock, presence: true
end
