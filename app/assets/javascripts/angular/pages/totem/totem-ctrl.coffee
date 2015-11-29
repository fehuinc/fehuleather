# STATE SHARED BY ALL PRODUCTS

angular.module "TotemCtrl", []

.controller "TotemCtrl", new Array "$scope", "GenerateProductSpecimens", "PanelManager", ($scope, GenerateProductSpecimens, PanelManager)->
  
  $scope.products = FEHU.totemProducts.map GenerateProductSpecimens
  $scope.shopInfo = FEHU.shopInfo
  
  # Organize the Configurations
  productsById = {}
  productsById[product.id] = product for product in $scope.products
  $scope.configurations = {}
  for configuration in FEHU.configurations
    console.log configuration
  
  # Only one info unit open at a time
  $scope.showingInfo = null
  $scope.isInfoOpen = (info)-> return info is $scope.showingInfo
  $scope.toggleInfo = (info)-> $scope.showingInfo = if $scope.isInfoOpen(info) then null else info
  
  $scope.isPanelOpen = PanelManager.isPanelOpen
