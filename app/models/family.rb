class Family < ActiveRecord::Base
  has_many :genuses
  has_many :infos
  
  validates :description, :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
