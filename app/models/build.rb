class Build < ActiveRecord::Base
  # has_one :product, through: :variation # Will this work?
  belongs_to :variation
  belongs_to :size
  has_many :order_items
  
  validates :variation, :size, :model, { presence: true }
  validates :model, { uniqueness: { case_sensitive: false } }
  validates :stock, { numericality: { only_integer: true } }
  
  def full_name
    @full_name ||= "#{size.name} #{variation.name} #{product.name}"
  end
end
