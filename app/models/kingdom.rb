class Kingdom < ActiveRecord::Base
  has_many :genuses
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
