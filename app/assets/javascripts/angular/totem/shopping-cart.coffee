angular.module "ShoppingCart", []

.directive "shoppingCart", new Array "$rootScope", ($rootScope)->
  controller: new Array "$scope", ($scope)->
    $rootScope.cartShowing = false
    
    closeCart = ()->
      $rootScope.toggleCart false
    
    $rootScope.toggleCart = (doShow)->
      $rootScope.cartShowing = doShow ?= not $rootScope.cartShowing
      $rootScope.toggleModalCover closeCart, $rootScope.cartShowing
      $rootScope.Cart.purgeDeleted()

    $scope.showCheckout = ()->
      $rootScope.cartItemsArray.length && $rootScope.cartItemsArray.some (i)-> !i.deleted
