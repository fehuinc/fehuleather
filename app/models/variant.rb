class Variant < ActiveRecord::Base
  has_many :variant_stock_joins # Destroyed by ensure_safe_destroy
  has_many :stocks, through: :variant_stock_joins
  belongs_to :variation
  
  validates :name, :variation, presence: true
  validates :cents_retail, :cents_wholesale, :sort_order, numericality: { only_integer: true }
  
  after_create :generate_stocks
  before_destroy :ensure_safe_destroy
  
  def price_retail
    cents_retail.to_d / 100
  end
  
  def price_retail=(price)
    self.cents_retail = (price.to_d * 100).to_i if price.present?
  end
  
  def price_wholesale
    cents_wholesale.to_d / 100
  end

  def price_wholesale=(price)
    self.cents_wholesale = (price.to_d * 100).to_i if price.present?
  end
  
  def ensure_safe_destroy
    # If the new variant is the last variant in a variation, we modify all existing stocks
    # to not include the dying variant. Otherwise, we destroy the stocks.
    
    variation = self.variation
    product = variation.product
    
    # If there's just 1 variant, carefully detach it from existing stocks, but leave the stocks alive
    if variation.variants.length == 1
      variant_stock_joins.delete_all
    else
      variant_stock_joins.destroy_all
    end

    return true
  end
  
  def generate_stocks
    
    # TEMPORARY HACK
    self.variation.product.stocks.each do |s|
      s.variant_stock_joins.delete_all
    end
    self.variation.product.stocks.delete_all
    
    Stockhausen.generate(self.variation.product)
  end
  
#
#   def generate_stocks
#     # If the new variant is the first variant in a new variation, we modify all existing stocks
#     # to include the new variant. Otherwise, we create a new set of stocks based on the intersection of all paths.
#
#     variation = self.variation
#     product = variation.product
#
#     # There's only 1 variation — just create a new stock
#     if product.variations.length == 1
#       create_new_stock [self], product
#
#     # There's more than 1 variation, but this is the first variant in a new variation
#     elsif variation.variants.length == 1
#       add_variant_to_existing_stocks product
#
#     # There's multiple variations, and multiple variants in this variation
#     else
#       create_new_stocks_with_variant product
#
#     end
#   end
#
# private
#
#   def add_variant_to_existing_stocks(product)
#     # Add this new variant to every existing stock
#     product.stocks.each do |stock|
#       stock.variants << self
#     end
#   end
#
#   def create_new_stocks_with_variant(product)
#     variation_stack = product.variations.select { |v| v != self.variation }
#     variant_set = [self]
#     recursively_create_stocks variation_stack, variant_set, product
#   end
#
#   def recursively_create_stocks(variation_stack, variant_set, product)
#     if variation_stack.length > 0
#       variation_stack.first.variants.each do |variant|
#         recursively_create_stocks variation_stack.drop(1), variant_set + [variant], product
#       end
#     else
#       create_new_stock variant_set, product
#     end
#   end
#
#   def create_new_stock(variant_set, product)
#     stock = product.stocks.create!
#     stock.variants = variant_set
#     stock.save!
#   end
end
