class Kingdom < ActiveRecord::Base
  # ASSUMPTIONS
  ## Kingdoms are never deleted
  
  has_many :products
  
  validates :name, { presence: true, uniqueness: { case_sensitive: false } }
end
