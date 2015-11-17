angular.module "Checkout", []

.controller "CheckoutCtrl", new Array "$rootScope", "$scope", "$location", ($rootScope, $scope, $location)->
  $scope.countries = ['Canada', 'United States']
  
  $scope.submit = ()->
    
    $location.path "/payment"
