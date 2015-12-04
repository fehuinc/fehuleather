angular.module "PrepProducts", []

.service "PrepProducts", new Array "PrepBuilds", "PrepSpecimens", "PrepVariations", (PrepBuilds, PrepSpecimens, PrepVariations)->
  # We take in a product (object).
  # We expect this product to include variations sorted by level.
  # We mutate and return the product
  return (product)->
    return PrepSpecimens PrepBuilds PrepVariations product



.service "PrepVariations", ()->
  (product)->
    # We will want quick access to specific variations for later code
    product.variationsById = {}
    for variation in product.variations
      product.variationsById[variation.id] = variation
      
      # While we're in here, let's create inverse links
      variation.product = product
      
      # We will want quick access to specific variants for later code, too
      variation.variantsById = {}
      for variant in variation.variants
        variation.variantsById[variant.id] = variant
        
        # Another inverse link
        variant.variation = variation

    return product



.service "PrepBuilds", new Array "BuildHasher", (BuildHasher)->
  
  partVariantName = (part)->
    part.variant.name
  
  sortBuildParts = (partA, partB)->
    return partA.variation.level - partB.variation.level
  
  
  return PrepBuilds = (product)->
    for build in product.builds
      
      # This is used as the ng-model for the quantity input in the totem-product-panel
      # We track it on a per-build basis — this, it's initialized here
      # This is gross, but necessary for now
      build.desiredQuantity = 1
      
      # Begin pre-computing the cost of this build
      build.cents_retail = product.cents_retail
      build.cents_wholesale = product.cents_wholesale
      
      for part in build.parts
        # Create direct links, so we don't need to go by ID in the future
        part.variation = product.variationsById[part.variation_id]
        part.variant = part.variation.variantsById[part.variant_id]
        
        # Continue to pre-compute cost
        build.cents_retail += part.variant.cents_retail
        build.cents_wholesale += part.variant.cents_wholesale
      
      # Variations come pre-sorted, but not build parts — we need to sort them by their variation's level
      # Sort happens in-place
      build.parts.sort sortBuildParts
      
      # Pre-compute names for each build
      build.name = build.parts.slice()
                              .reverse() # in place
                              .map partVariantName
                              .concat product.name
                              .join " "
      
      # Generate the hash key, and store the build under this key
      BuildHasher.setupProductBuild product, build
      
    return product

    

.service "PrepSpecimens", ()->
  
  totemImagePath = (variant, product, namesOfDefaultVariantsWithImages)->
    file = "#{product.name}/totem/"
    file += [variant.name].concat(namesOfDefaultVariantsWithImages).join("-")
    file = file.toLowerCase()
        .replace('&', 'and')
        .replace(/[^0-9a-z\-\/]/g, ' ')
        .replace(/\s+/g, '-')
    file = "#{FEHU.imagePath}#{file}.jpg"
  
  
  return PrepSpecimens = (product)->
    # We want the default variant of all variations that have an image
    namesOfDefaultVariantsWithImages = []
    
    # We're going to loop through all variations and do some setup
    for variation, variationIndex in product.variations
      defaultVariant = null
      defaultVariantIndex = null
      
      for variant, variantIndex in variation.variants when variant.default
        defaultVariant = variant
        defaultVariantIndex = variantIndex
      
      # If there's no default, we'll just use the first result
      unless defaultVariant?
        defaultVariant = variation.variants[0]
        defaultVariantIndex = 0
      
      # Store the currently selected variant
      variation.choiceIndex = defaultVariantIndex
      
      # Skip the first variation, because we're already using it for the totem
      if variationIndex > 0 and variation.has_image
        namesOfDefaultVariantsWithImages.push defaultVariant.name
    
    # Now, we can start to generate specimens
    specimens = for variant in product.variations[0].variants
      totem: totemImagePath variant, product, namesOfDefaultVariantsWithImages
      variant: variant
    
    # We're going to clone the list until it's long enough to wrap around the totem properly
    clonedSpecimens = []
    while clonedSpecimens.length < 7
      clonedSpecimens = clonedSpecimens.concat specimens
    specimens = clonedSpecimens
    
    # Now we need to introduce some uniqueness to make ng-repeat happy
    specimens = for s, i in specimens
      variant: s.variant
      totem: s.totem
      specimenIndex: i
    
    product.specimens = specimens
    return product