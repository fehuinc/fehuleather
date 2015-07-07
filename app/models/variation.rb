class Variation < ActiveRecord::Base
  has_many :variants
  belongs_to :product
  
  validates :has_image, :level, :name, presence: true
  validates :level, numericality: { only_integer: true }
end
