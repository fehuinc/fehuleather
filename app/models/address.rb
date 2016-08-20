class Address < ApplicationRecord
  # No Order associations, because we should never need to look up any Order by Address!
  belongs_to :merchant # Optional
  
  validates :name, :email, :line1, :city, :code, :region, :country, { presence: true }
end
