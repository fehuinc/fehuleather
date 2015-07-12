class Variant < ActiveRecord::Base
  has_many :variant_stock_joins, dependent: :destroy_all
  has_many :stocks, through: :variant_stock_joins
  belongs_to :variation
  
  validates :name, :variation, presence: true
  validates :price_retail, :price_wholesale, numericality: true
  
  # If the new variant is the first variant in a new variation, we extend all existing stocks
  # to include the new variant. Otherwise, we create a new set of stocks based on the intersection of all paths.
  after_create :generate_stocks
  
  def generate_stocks
    variation = self.variation
    product = variation.product
    
    # There's only 1 variation — just create a new stock
    if product.variations.length == 1
      create_new_stock [self], product
    
    # There's more than 1 variation, but this is the first variant in a new variation
    elsif variation.variants.length == 1
      add_variant_to_existing_stocks product
    
    # There's multiple variations, and multiple variants in this variation
    else
      create_new_stocks_with_variant product
    end
  end
  
private
  
  def add_variant_to_existing_stocks(product)
    # Add this new variant to every existing stock
    product.stocks.each do |stock|
      stock.variants << self
    end
  end
  
  def create_new_stocks_with_variant(product)
    variation_stack = product.variations.select { |v| v != self.variation }
    variant_set = [self]
    recursively_create_stocks variation_stack, variant_set, product
  end
  
  def recursively_create_stocks(variation_stack, variant_set, product)
    if variation_stack.length > 0
      variation_stack.first.variants.each do |variant|
        recursively_create_stocks variation_stack.drop(1), variant_set + [variant], product
      end
    else
      create_new_stock variant_set, product
    end
  end
  
  def create_new_stock(variant_set, product)
    stock = product.stocks.create!
    stock.variants = variant_set
    stock.save!
  end
end
