class CurrentOrder < ActiveRecord::Base
  belongs_to :merchant
  has_many :current_order_stock_joins
  has_many :stocks, through: :current_order_stock_joins

  validates :merchant, presence: true
end
