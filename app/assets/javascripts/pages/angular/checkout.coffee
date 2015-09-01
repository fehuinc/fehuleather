angular.module "Checkout", []

.run new Array "SessionStorage", "$rootScope", (SessionStorage, $rootScope)->
  defaultShippingAddress =
    country: "Canada"
  
  SessionStorage.bind($rootScope, "shippingAddress", defaultShippingAddress)

  # See if we can load some saved address data
  # if not $rootScope.shippingAddress?
  #   if $scope.saveShippingAddress
  #     LocalStorage.get("shippingAddress")
  #     $rootScope.shippingAddress = LocalStorage.get("shippingAddress") or defaultShippingAddress
  #   else
  #     LocalStorage.set("shippingAddress", defaultShippingAddress) # Clear old data, too
  #     $rootScope.shippingAddress = defaultShippingAddress


.controller "CheckoutCtrl", new Array "LocalStorage", "$rootScope", "$scope", "$location", (LocalStorage, $rootScope, $scope, $location)->
  
  $scope.countries = ['Canada', 'United States']
  
  LocalStorage.bind($scope, "saveShippingAddress", true)
    
  $scope.submit = ()->
    if $scope.saveShippingAddress
      LocalStorage.set("shippingAddress", $rootScope.shippingAddress)
    
    $location.path "/payment"
