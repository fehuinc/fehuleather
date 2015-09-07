class Merchant < ActiveRecord::Base
  has_many :orders
  has_one :current_order
  
  validates :phone_number, :email, :your_name, :store_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  
  after_create :create_current_order
end
