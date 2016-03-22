class Address < ActiveRecord::Base
  # No order associations, because we should never need to look up any order by address!
  belongs_to :merchant # Optional
  
  validates :name, :email, :line1, :code, :region, :country, { presence: true }
end
