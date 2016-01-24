class BuildMaker
  def self.new_variation(product, variation)
    variation.builds = product.sizes.map { |size| size.builds.new }
    variation.save
  end

  def self.new_size(product, size)
    size.builds = product.variations.map { |variation| variation.builds.new }
    size.save
  end
end
