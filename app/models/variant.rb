class Variant < ActiveRecord::Base
  belongs_to :variation
  
  has_many :parts, class_name: ConfigurationPart # TODO: Create/Destroy in Stockhausen
  has_many :configurations, through: :parts # TODO: Create/Destroy in Stockhausen
  
  validates :name, :variation, { presence: true }
  validates :cents_retail, :cents_wholesale, :sort_order, { numericality: { only_integer: true } }
  
  # TODO: Check these:
  after_create :generate_configurations
  before_destroy :ensure_safe_destroy
  
  def default
    variation.product.default_variant_id == self.id
  end
  
  def default=(isDefault)
    if isDefault
      variation.product.default_variant_id = self.id
    elsif self.default
      variation.product.default_variant_id = nil
    end
  end
  
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
    # If the new variant is the last variant in a variation, we modify all existing configurations
    # to not include the dying variant. Otherwise, we destroy the configurations.
    
    variation = self.variation
    product = variation.product
    
    # If there's just 1 variant, carefully detach it from existing configurations, but leave the configurations alive
    if variation.variants.length == 1
      variant_configuration_joins.delete_all
    else
      variant_configuration_joins.destroy_all
    end

    return true
  end
  
  def generate_configurations
    
    # TEMPORARY HACK
    variation.product.configurations.each do |configuration|
      configuration.parts.delete_all
    end
    variation.product.configurations.delete_all
    
    Stockhausen.generate(variation.product)
  end
  
#
#   def generate_configurations
#     # If the new variant is the first variant in a new variation, we modify all existing configurations
#     # to include the new variant. Otherwise, we create a new set of configurations based on the intersection of all paths.
#
#     variation = self.variation
#     product = variation.product
#
#     # There's only 1 variation — just create a new configuration
#     if product.variations.length == 1
#       create_new_configuration [self], product
#
#     # There's more than 1 variation, but this is the first variant in a new variation
#     elsif variation.variants.length == 1
#       add_variant_to_existing_configurations product
#
#     # There's multiple variations, and multiple variants in this variation
#     else
#       create_new_configurations_with_variant product
#
#     end
#   end
#
# private
#
#   def add_variant_to_existing_configurations(product)
#     # Add this new variant to every existing configuration
#     product.configurations.each do |configuration|
#       configuration.variants << self
#     end
#   end
#
#   def create_new_configurations_with_variant(product)
#     variation_stack = product.variations.select { |v| v != self.variation }
#     variant_set = [self]
#     recursively_create_configurations variation_stack, variant_set, product
#   end
#
#   def recursively_create_configurations(variation_stack, variant_set, product)
#     if variation_stack.length > 0
#       variation_stack.first.variants.each do |variant|
#         recursively_create_configurations variation_stack.drop(1), variant_set + [variant], product
#       end
#     else
#       create_new_configuration variant_set, product
#     end
#   end
#
#   def create_new_configuration(variant_set, product)
#     configuration = product.configurations.create!
#     configuration.variants = variant_set
#     configuration.save!
#   end
end
