angular.module "ProductInfo", []

.directive "productInfo", new Array "Cart", "$rootScope", "$timeout", (Cart, $rootScope, $timeout)->
  controller: new Array "$scope", ($scope)->
    $scope.isInCart = Cart.has
    $scope.getQuantity = Cart.quantity
    
    $scope.addToCart = (product)->
      Cart.add(product)
        
    # This manipulates the DOM
    $scope.showCart = ()->
      document.body.scrollTop = 0
      $timeout (()-> $rootScope.cartShowing = true), 200
    
    
    # This probably belongs in a Product model
    $scope.choicePrice = (product)->
      price = product.cents_retail
      
      for variation in product.variations
        price += variation.choice.cents_retail
      
      return product.quantity * price / 100
    
    
    # This is the same as toggleProduct in totem-ctrl
    $scope.showingInfo = null # Must be on scope
    $scope.isInfoOpen = (info)-> return info is $scope.showingInfo
    $scope.toggleInfo = (info)-> $scope.showingInfo = if $scope.isInfoOpen(info) then null else info
        
