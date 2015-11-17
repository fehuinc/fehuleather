angular.module "Cart", []

.service "Cart", new Array "$rootScope", "LocalStorage", "CartProduct", ($rootScope, LocalStorage, CartProduct)->
  
  # HELPERS
  updateCartEmpty = ()->
    $rootScope.cartEmpty = $rootScope.cartItemsArray.length is 0
  
  rebuildArray = ()->
    $rootScope.cartItemsArray = (item for k, item of $rootScope.cartItemsHash)
  
  resetCart = ()->
    $rootScope.cartItemsHash = {}
    $rootScope.cartItemsArray = []
    $rootScope.cartEmpty = true
  
  
  # SETUP
  LocalStorage.bind($rootScope, "cartItemsHash", {})
  LocalStorage.bind($rootScope, "cartItemsArray", [])
  updateCartEmpty()
  
  
  # API
  return Cart =
    add: (product)->
      cartProduct = CartProduct(product)
      $rootScope.cartItemsHash[cartProduct.choiceName] = cartProduct
      rebuildArray()
      $rootScope.cartEmpty = false
    
    remove: (product)->
      delete $rootScope.cartItemsHash[product.choiceName]
      rebuildArray()
      updateCartEmpty()
    
    has: (product)->
      cartProduct = CartProduct(product)
      return $rootScope.cartItemsHash[cartProduct.choiceName]?
    
    quantity: (product)->
      cartProduct = CartProduct(product)
      return $rootScope.cartItemsHash[cartProduct.choiceName]?.quantity or 0
    
    reset: ()->
      resetCart()

    array: ()->
      return $rootScope.cartItemsArray
    
    hash: ()->
      return $rootScope.cartItemsHash
    
