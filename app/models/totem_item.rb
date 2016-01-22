class TotemItem < ActiveRecord::Base
  belongs_to :row, class_name: "TotemRow", inverse_of: :items
  belongs_to :build
  
  validates :index, :ypos, { numericality: { only_integer: true } }
end
