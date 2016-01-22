class TotemRow < ActiveRecord::Base
  has_many :items, class_name: "TotemItem", dependent: :destroy, inverse_of: :row

  validates :index, { presence: true, numericality: { only_integer: true } }
end
