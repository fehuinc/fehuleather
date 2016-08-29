class RetailOrder < ApplicationRecord
  belongs_to :address
  has_many :items, as: :order, class_name: OrderItem, dependent: :destroy
  
  def to_param
    uuid.parameterize
  end
end
