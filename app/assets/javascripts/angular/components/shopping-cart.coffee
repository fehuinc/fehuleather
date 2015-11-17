angular.module "ShoppingCart", []

.directive "shoppingCart", new Array "Cart", "$rootScope", (Cart, $rootScope)->
  controller: ($scope)->
    $rootScope.cartShowing = false
    
    $scope.toggle = ()->
      $rootScope.cartShowing = !$rootScope.cartShowing
    
    $scope.reset = ()->
      Cart.reset()
    
    $scope.remove = (item)->
      Cart.remove(item)
