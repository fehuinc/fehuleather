class Merchant < ActiveRecord::Base
  validates :phone_number, :email, :your_name, :store_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
end
