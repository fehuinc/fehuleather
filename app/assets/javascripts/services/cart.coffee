angular.module "Cart", []

.service "Cart", new Array "$rootScope", "LocalStorage", ($rootScope, LocalStorage)->
  
  # HELPERS
  setCartEmpty = (enabled = true)->
    $rootScope.cartEmpty = enabled
  
  updateCartEmpty = ()->
    setCartEmpty()
    for item of $rootScope.cartItems
      return setCartEmpty(false)
  
  resetCart = ()->
    $rootScope.cartItems = {}
    setCartEmpty()
  
  
  # SETUP
  
  # If the cart has stuff in it, load that stuff into $rootScope. Otherwise, init to {}
  LocalStorage.bind($rootScope, "cartItems", {})
  updateCartEmpty()
  
  
  # API
  return Cart =
    add: (product)->
      cartProduct =
        name: product.name
        quantity: product.quantity
        image: product.totem
        cents: product.cents_retail
        choices: []
      
      for variation in product.variations
        choice = variation.choice
        cartProduct.choices.push {
          name: choice.name
          id: choice.id
        }
        cartProduct.cents += choice.cents_retail
        cartProduct.name = choice.name + " " + cartProduct.name
      
      $rootScope.cartItems[cartProduct.name] = cartProduct
      
      setCartEmpty(false)
      
    remove: (product)->
      delete $rootScope.cartItems[product.name]
      updateCartEmpty()
    
    all: ()->
      return $rootScope.cartItems
    
    reset: ()->
      resetCart()
