# STATE SHARED BY ALL PRODUCTS

angular.module "TotemCtrl", []

.controller "TotemCtrl", new Array "$scope", "PrepProducts", "PanelManager", ($scope, PrepProducts, PanelManager)->
  
  $scope.products = FEHU.totemProducts.map PrepProducts
  $scope.shopInfo = FEHU.shopInfo
  
  # Panel functions
  $scope.isPanelOpen = PanelManager.isPanelOpen
  $scope.closePanel = PanelManager.closePanel
  
  # Panel Info state and functions
  $scope.showingInfo = null
  $scope.isInfoOpen = (info)-> return info is $scope.showingInfo
  $scope.toggleInfo = (info)-> $scope.showingInfo = if $scope.isInfoOpen(info) then null else info
