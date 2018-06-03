class TotemItem < ApplicationRecord
  belongs_to :row, class_name: "TotemRow", inverse_of: :items, foreign_key: :totem_row_id
  belongs_to :variation, optional: true
  has_one :product, through: :variation

  validates :index, { numericality: { only_integer: true } }

  def is_product
    variation_id.present?
  end

  def real_name
    variation_id ? variation.list_name : name
  end

  def real_image
    variation_id ? variation.totem_image : image
  end

  def show_retail
    if !variation_id
      true
    elsif variation.builds.where(show_retail: true).any?
      true
    else
      false
    end
  end

  def sold_out
    is_product && variation.sold_out
  end
end
