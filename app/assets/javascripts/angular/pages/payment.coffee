angular.module "Payment", []

.controller "PaymentCtrl", new Array "$scope", "$rootScope", "$http", "$location", ($scope, $rootScope, $http, $location)->
  
  success = (response)->
    Cart.reset()
    $location.path("/order/#{response.code}")
    
  failure = (response)->
    alert("Sorry — your order failed.")
  
  $scope.submitToRails = ()->
    data =
      address: $rootScope.shippingAddress
      cart: $rootScope.Cart.hash()
    $http.post("/api/checkout", data).then(success, failure)
      
    
    
    
