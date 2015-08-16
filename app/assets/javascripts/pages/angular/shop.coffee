angular.module "Shop", []

.controller "ShopCtrl", new Array "$http", "$scope", ($http, $scope)->
  
  ## LOCALS
  showingProduct =
    index: null
    scope: null
  
  
  ## SCOPE LOCALS
  $http.get("/api/totem").then (response)->
    console.log $scope.products = response.data
    
    for product in $scope.products
      product.specimens = []
      variation = product.variations.sort("level")[0]
      
      for variant in variation.variants
        file = product.name
        
        if variation.has_image
          file += " " + variant.name
        
        file = file.toLowerCase()
            .replace('&', 'and')
            .replace(/[^0-9a-z\-]/g, ' ')
            .replace(/\s+/g, '-')
        
        product.specimens.push
          name: variant.name
          hero: "/images/content/hero/#{file}.jpg"
  
  ## SCOPE FUNCTIONS
  
  $scope.infoIsOpen = (productIndex)->
    return showingProduct.index is productIndex
  
  $scope.toggleProductInfo = (productIndex, productScope)->
    showingProduct.scope?.showingProductInfo = false
    
    if showingProduct.index is productIndex
      showingProduct.index = null
      showingProduct.scope = null
    else
      showingProduct.index = productIndex
      showingProduct.scope = productScope
      showingProduct.scope?.showingProductInfo = true
  
