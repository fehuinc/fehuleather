class Kingdom < ActiveRecord::Base
  has_many :products, dependent: :destroy_all
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
