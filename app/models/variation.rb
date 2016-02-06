class Variation < ActiveRecord::Base
  belongs_to :product
  has_many :builds, dependent: :destroy
  has_many :totem_items, dependent: :destroy
  has_one :wholesale_image, as: :imageable, dependent: :destroy
  has_one :totem_image, as: :imageable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  
  accepts_nested_attributes_for :builds
  
  validates :name, :product, { presence: true }
  
  monetize :price_retail_cents
  monetize :price_wholesale_cents
  
  def full_name
    @full_name ||= "#{name} #{product.name}"
  end
end
