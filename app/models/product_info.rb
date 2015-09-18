class ProductInfo < ActiveRecord::Base
  belongs_to :product
  
  validates :product, :name, :content, { presence: true }
end
