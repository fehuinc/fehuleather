class Size < ApplicationRecord
  belongs_to :product
  has_many :builds

  validates :name, { presence: true }
end
