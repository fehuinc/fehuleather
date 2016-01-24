class Size < ActiveRecord::Base
  belongs_to :product
  has_many :builds
  
  validates :name, { presence: true }
end
