angular.module "Checkout", []

.controller "CheckoutCtrl", new Array "LocalStorage", "$rootScope", "$scope", "$location", (LocalStorage, $rootScope, $scope, $location)->
  LocalStorage.bind($scope, "saveShippingAddress", true)
  
  # See if we can load some saved address data
  if not $rootScope.shippingAddress?
    if $scope.saveShippingAddress
      LocalStorage.get("shippingAddress")
      $rootScope.shippingAddress = LocalStorage.get("shippingAddress") or {}
    else
      LocalStorage.set("shippingAddress", {}) # Clear old data, too
      $rootScope.shippingAddress = {}
  
  $scope.submit = ()->
    if $scope.saveShippingAddress
      LocalStorage.set("shippingAddress", $rootScope.shippingAddress)
    
    $location.path "/payment"
