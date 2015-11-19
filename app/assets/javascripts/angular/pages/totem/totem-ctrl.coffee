# STATE SHARED BY ALL PRODUCTS

angular.module "TotemCtrl", []

.controller "TotemCtrl", new Array "$scope", "GenerateProductSpecimens", "PanelManager", ($scope, GenerateProductSpecimens, PanelManager)->
  
  $scope.products = FEHU.totemProducts.map GenerateProductSpecimens
  $scope.shopInfo = FEHU.shopInfo
  
  # Only one info unit open at a time
  $scope.showingInfo = null
  $scope.isInfoOpen = (info)-> return info is $scope.showingInfo
  $scope.toggleInfo = (info)-> $scope.showingInfo = if $scope.isInfoOpen(info) then null else info
  
  $scope.isPanelOpen = PanelManager.isPanelOpen
