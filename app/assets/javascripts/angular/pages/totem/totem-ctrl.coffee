angular.module "TotemCtrl", []
.controller "TotemCtrl", new Array "$scope", "GenerateProductSpecimens", ($scope, GenerateProductSpecimens)->
    
  $scope.products = FEHU.totemProducts.map GenerateProductSpecimens
  $scope.shopInfo = FEHU.shopInfo
  
  # This is the same as toggleInfo in product-info
  showingProduct = null
  $scope.isProductOpen = (product)-> return showingProduct is product
  $scope.toggleProduct = (product)-> showingProduct = if $scope.isProductOpen(product) then null else product
