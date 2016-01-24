class Product < ActiveRecord::Base
  belongs_to :kingdom
  has_many :infos, class_name: ProductInfo, dependent: :delete_all
  has_many :variations, dependent: :destroy
  has_many :builds, through: :variation
  has_many :sizes, dependent: :delete_all
  
  validates :kingdom, :name, { presence: true }
  validates :name, { uniqueness: { case_sensitive: false } }
  
  monetize :price_retail_cents
  monetize :price_wholesale_cents
end
