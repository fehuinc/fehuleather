class ProductInfo < ActiveRecord::Base
  belongs_to :product, inverse_of: :infos
  
  validates :product, :name, :content, { presence: true }
end
