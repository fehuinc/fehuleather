angular.module "CheckoutInfo", []

.run new Array "SessionStorage", "$rootScope", (SessionStorage, $rootScope)->
  defaultCheckoutInfo =
    shippingAddress:
      country: "Canada"
  
  SessionStorage.bind($rootScope, "checkoutInfo", defaultCheckoutInfo)
