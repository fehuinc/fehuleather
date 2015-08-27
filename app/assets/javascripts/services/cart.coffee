angular.module "Cart", []

.service "Cart", new Array "$rootScope", "LocalStorage", ($rootScope, LocalStorage)->
  LocalStorage.bind($rootScope, "cartItems", {})
  
  do checkCartEmpty = ()->
    $rootScope.cartEmpty = true
    for item of $rootScope.cartItems
      return $rootScope.cartEmpty = false
  
  return Cart =
    add: (product)->
      cartProduct =
        name: product.name
        image: product.totem
        cents: product.cents_retail
        choices: []
      
      for variation in product.variations
        console.log variation.choiceIndex
        choice = variation.choice
        cartProduct.choices.push {
          name: choice.name
          id: choice.id
        }
        cartProduct.cents += choice.cents_retail
        cartProduct.name = choice.name + " " + cartProduct.name
      
      unless $rootScope.cartItems[cartProduct.name]?
        $rootScope.cartItems[cartProduct.name] = cartProduct
      
      $rootScope.cartEmpty = false
      
    remove: (product)->
      delete $rootScope.cartItems[product.name]
      checkCartEmpty()
