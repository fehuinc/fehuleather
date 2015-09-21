class Stockhausen
  def self.generate(product)
    variations = product.variations.order(:level)
    variant_sets = generate_variant_sets(variations)
    if variant_sets.first.any?
      variant_sets.each do |variant_set|
        configuration = product.configurations.create!
        variant_set.each do |variant|
          configuration.parts.create! variant: variant, variation: variant.variation
        end
        configuration.save!
      end
    end
  end
  
  def self.generate_variant_sets(variations, variant_stack = [], variant_sets = [])
    if variations.count > 0
      if variations.first.variants.count > 0
        variations.first.variants.order(:name).each do |variant|
          variant_sets = self.generate_variant_sets(variations.drop(1), variant_stack + [variant], variant_sets)
        end
        return variant_sets
      end
      return self.generate_variant_sets(variations.drop(1), variant_stack, variant_sets)
    end
    return variant_sets + [variant_stack]
  end
end
