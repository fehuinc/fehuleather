class Merchant < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  belongs_to :current_order, class_name: "Order"
  
  validates :email, :phone_number, :store_name, :your_name, { presence: true }
  validates :email, { uniqueness: { case_sensitive: false } }
  validates :email, { format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ } }
end
