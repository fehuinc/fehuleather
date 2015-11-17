angular.module "Shop", []

.controller "ShopCtrl", new Array "Totem", "$scope", (Totem, $scope)->
  
  ## LOCALS
  showingProduct =
    index: null
    scope: null
  
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
  
