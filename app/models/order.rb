class Order < ActiveRecord::Base
  # ASSUMPTIONS
  ## Orders are never deleted
  
  belongs_to :merchant # Optional — will be nil if this is a retail order
  has_many :order_items
  
  enum status: [:open, :submitted, :paid, :shipped] # WARNING: ENUM! APPEND ONLY!
  
  # TODO: What do I do to validate the enum?? Something like.... (?)
  # validates :status, { presence: true, numericality: { only_integer: true } }
end
