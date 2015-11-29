class Variant < ActiveRecord::Base
  belongs_to :variation
  
  has_many :parts, class_name: BuildPart # TODO: Create/Destroy in Stockhausen
  has_many :builds, through: :parts # TODO: Create/Destroy in Stockhausen
  
  validates :name, :variation, { presence: true }
  validates :cents_retail, :cents_wholesale, :sort_order, { numericality: { only_integer: true } }
  
  # TODO: Check these:
  after_create :generate_builds
  before_destroy :ensure_safe_destroy
  
  # WE SHOULD PROBABLY PRE-GENERATE THESE AND CACHE THEM IN THE DB
  def totem_image
    totem_variant_names = variation.product.variations.drop(1).map(&:default_variant).select(&:has_image).map(&:name).join("-")
    
    path = "#{variation.product.name}/totem/#{name} #{totem_variant_names}".strip
    path = path.downcase()
               .gsub('&', 'and')
               .gsub(/[^0-9a-z\-\/]/, ' ')
               .gsub(/\s+/, '-')
    "#{ENV['IMAGEPATH']}#{path}.jpg"
  end

  def has_image
    variation.has_image
  end
    
  def default
    if variation.default_variant_id.present?
      variation.default_variant_id == self.id
    else
      variation.variants.first.id == self.id
    end
  end
  
  def default=(isDefault)
    if isDefault
      variation.default_variant_id = self.id
      variation.save!
    elsif self.default
      variation.default_variant_id = nil
      variation.save!
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
    # If the new variant is the last variant in a variation, we modify all existing builds
    # to not include the dying variant. Otherwise, we destroy the builds.
    
    variation = self.variation
    product = variation.product
    
    # If there's just 1 variant, carefully detach it from existing builds, but leave the builds alive
    if variation.variants.length == 1
      variant_build_joins.delete_all
    else
      variant_build_joins.destroy_all
    end

    return true
  end
  
  def generate_builds
    
    # TEMPORARY HACK
    variation.product.builds.each do |build|
      build.parts.delete_all # This seems to leave garbage
    end
    variation.product.builds.delete_all # This seems to leave garbage
    
    Stockhausen.generate variation.product
  end
  
#
#   def generate_builds
#     # If the new variant is the first variant in a new variation, we modify all existing builds
#     # to include the new variant. Otherwise, we create a new set of builds based on the intersection of all paths.
#
#     variation = self.variation
#     product = variation.product
#
#     # There's only 1 variation — just create a new build
#     if product.variations.length == 1
#       create_new_build [self], product
#
#     # There's more than 1 variation, but this is the first variant in a new variation
#     elsif variation.variants.length == 1
#       add_variant_to_existing_builds product
#
#     # There's multiple variations, and multiple variants in this variation
#     else
#       create_new_builds_with_variant product
#
#     end
#   end
#
# private
#
#   def add_variant_to_existing_builds(product)
#     # Add this new variant to every existing build
#     product.builds.each do |build|
#       build.variants << self
#     end
#   end
#
#   def create_new_builds_with_variant(product)
#     variation_stack = product.variations.select { |v| v != self.variation }
#     variant_set = [self]
#     recursively_create_builds variation_stack, variant_set, product
#   end
#
#   def recursively_create_builds(variation_stack, variant_set, product)
#     if variation_stack.length > 0
#       variation_stack.first.variants.each do |variant|
#         recursively_create_builds variation_stack.drop(1), variant_set + [variant], product
#       end
#     else
#       create_new_build variant_set, product
#     end
#   end
#
#   def create_new_build(variant_set, product)
#     build = product.builds.create!
#     build.variants = variant_set
#     build.save!
#   end
end
