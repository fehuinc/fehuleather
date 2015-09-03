angular.module "ShippingAddress", []

.run new Array "SessionStorage", "$rootScope", (SessionStorage, $rootScope)->
  defaultShippingAddress =
    country: "Canada"
  
  SessionStorage.bind($rootScope, "shippingAddress", defaultShippingAddress)
  
