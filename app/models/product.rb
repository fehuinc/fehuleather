class Product < ActiveRecord::Base
  has_many :infos, dependent: :delete_all
  has_many :stocks, dependent: :delete_all
  has_many :variations, dependent: :delete_all
  belongs_to :kingdom
  
  validates :description, :kingdom, :name, presence: true
  validates :price_retail, :price_wholesale, numericality: true
  validates :name, uniqueness: { case_sensitive: false }
  
end
