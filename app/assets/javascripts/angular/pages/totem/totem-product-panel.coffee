# STATE LOCAL TO THE PANEL WITHIN ONE PRODUCT

angular.module "TotemProductPanel", []

.directive "totemProductPanel", new Array "Cart", "$rootScope", "$timeout", (Cart, $rootScope, $timeout)->
  controller: new Array "$scope", ($scope)->
    $scope.isInCart = Cart.has
    $scope.getQuantity = Cart.quantity
    
    $scope.addToCart = (product)->
      Cart.add(product)
    
    # This manipulates the DOM
    $scope.showCart = ()->
      document.body.scrollTop = 0
      $timeout (()-> $rootScope.cartShowing = true), 300

    $scope.checkChange = (variantIndex, variation)->
      if variantIndex is 0
        $scope.setCenterSpecimen(variation.choiceIndex)
    
    $scope.choiceQuantity = ()->
      1
    
    # This probably belongs in a Product model
    $scope.choicePrice = (product)->
      price = product.cents_retail
      
      for variation in product.variations
        price += variation.choice.cents_retail
      
      return product.quantity * price / 100
