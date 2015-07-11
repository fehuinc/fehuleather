class Info < ActiveRecord::Base
  belongs_to :product

  validates :content, :product, :name, presence: true
end
