class Genus < ActiveRecord::Base
  belongs_to :family
  belongs_to :kingdom

  validates :description, :family, :kingdom, :name, :price_retail, :price_wholesale, presence: true
  validates :price_retail, :price_wholesale, numericality: true
end
