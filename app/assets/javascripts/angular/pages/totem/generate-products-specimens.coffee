# SetupTotemProducts
# We take in a product (object).
# We expect this product to include a "variations" key, sorted by level.

angular.module "GenerateProductSpecimens", []
.service "GenerateProductSpecimens", ()->
  
  
  
  generateTotemImagePath = (variant, product, namesOfDefaultVariantsWithImages)->
    file = "#{product.name}/totem/"
    file += [variant.name].concat(namesOfDefaultVariantsWithImages).join("-")
    file = file.toLowerCase()
        .replace('&', 'and')
        .replace(/[^0-9a-z\-\/]/g, ' ')
        .replace(/\s+/g, '-')
    file = "#{FEHU.imagePath}#{file}.jpg"
  
  
  
  # We mutate and return the product
  return (product)->
    
    # We want the default variant of all variations that have an image
    namesOfDefaultVariantsWithImages = []
    
    # We're going to loop through all variations and do some setup
    for variation, i in product.variations
      defaultVariant = null
      defaultVariantIndex = null
      
      for variant, vi in variation.variants when variant.default
        defaultVariant = variant
        defaultVariantIndex = vi
      
      # If there's no default, we'll just use the first result
      unless defaultVariant?
        defaultVariant = variation.variants[0]
        defaultVariantIndex = 0
      
      # Do we need these? Here??
      variation.choice = defaultVariant
      variation.choiceIndex = defaultVariantIndex
      
      # Skip the first variation, because we're already using it for the totem
      if i > 0 and variation.has_image
        namesOfDefaultVariantsWithImages.push defaultVariant.name
    
    # Now, generate specimens
    product.specimens = for variant in product.variations[0].variants
      name: variant.name
      totem: generateTotemImagePath variant, product, namesOfDefaultVariantsWithImages
      description: variant.description
    
    return product
