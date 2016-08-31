class Product < ApplicationRecord
  belongs_to :kingdom
  has_many :infos, class_name: ProductInfo, dependent: :delete_all
  has_many :variations, dependent: :destroy
  has_many :builds, through: :variations
  has_many :sizes, dependent: :delete_all
  
  validates :kingdom, :name, { presence: true }
  validates :name, { uniqueness: { case_sensitive: false } }
  
  monetize :price_retail_cents
  monetize :price_wholesale_cents
  
  def totem_image
    variations.first.totem_image
  end

  def wholesale_image
    v = variations.first
    v.wholesale_image
  end
  
  def show_wholesale
    builds.where(show_wholesale: true).any?
  end
end
