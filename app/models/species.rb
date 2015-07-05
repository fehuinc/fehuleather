class Species < ActiveRecord::Base
  belongs_to :genus
  
  validates :genus, :name, :price_retail, :price_wholesale, :show_retail, :show_wholesale, :stock, presence: true
  validates :price_retail, :price_wholesale, numericality: true
  validates :stock, numericality: { only_integer: true }
end
