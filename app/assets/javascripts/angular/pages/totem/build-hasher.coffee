angular.module "BuildHasher", []

.service "BuildHasher", ()->
  
  return BuildHasher =

    
    setupProductBuild: (product, build)->
      variantIDs = for part in build.parts
        part.variant_id
      hash = variantIDs.join "-"
      
      build.hashKey = hash
      (product.buildsByHashKey ?= {})[hash] = build
    
    
    buildFromProductChoices: (product)->
      variantIDs = for variation in product.variations
        variant = variation.variants[variation.choiceIndex]
        variant.id
      
      hash = variantIDs.join "-"
      
      return product.buildsByHashKey[hash]
      
