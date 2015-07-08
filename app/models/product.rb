class Product < ActiveRecord::Base
  has_many :infos
  has_many :stocks
  has_many :variations
  belongs_to :kingdom
  
  validates :description, :kingdom, :name, presence: true
  validates :price_retail, :price_wholesale, numericality: true
  validates :name, uniqueness: { case_sensitive: false }
  
end
