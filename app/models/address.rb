class Address < ActiveRecord::Base
  has_many :orders, polymorphic: true
  
end
