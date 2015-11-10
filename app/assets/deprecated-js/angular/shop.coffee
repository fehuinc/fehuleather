angular.module "Shop", []

.controller "ShopCtrl", new Array "Totem", "$scope", (Totem, $scope)->
  
  ## LOCALS
  showingProduct =
    index: null
    scope: null
  
  
  ## SCOPE LOCALS
  $scope.shopInfos = [
    {name: "Payment", content: "You can pay with your own blood!"}
    {name: "Shipping", content: "We don't actually use ships."}
    {name: "Returns", content: "The return statement lets you get data back out of a function."}
    {name: "Questions", content: "Answers"}
  ]
  
  
  ## LOAD PRODUCT DATA
  
  Totem.load().then (products)->
    $scope.products = products
  
  
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
  
