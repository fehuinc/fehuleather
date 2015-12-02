angular.module "Cart", []


.run new Array "$rootScope", "Cart", ($rootScope, Cart)->
  # Various views use the Cart API directly
  $rootScope.Cart = Cart


.service "Cart", new Array "$rootScope", "LocalStorage", ($rootScope, LocalStorage)->
  
  # HELPERS
  sortByName = (a, b)->
    a.name.length - b.name.length
  
  rebuildArray = ()->
    $rootScope.cartItemsArray = (v for k, v of $rootScope.cartItemsHash).sort sortByName
  
  
  # SETUP
  LocalStorage.bind $rootScope, "cartItemsHash", {}
  rebuildArray()
  
  
  # API
  return Cart =
    has: (build)->
      item = $rootScope.cartItemsHash[build.id]
      return item? and not item.deleted
    
    get: (build)->
      return $rootScope.cartItemsHash[build.id]

    add: (build)->
      item = $rootScope.cartItemsHash[build.id] ?=
        build_id: build.id
        name: build.name # Stored in case the build is later deleted
        cents: build.cents_retail
        deleted: false
      
      item.quantity = build.desiredQuantity
      rebuildArray()
    
    deleteItem: (item, doDelete = true)->
      $rootScope.cartItemsHash[item.build_id]?.deleted = doDelete
    
    purgeDeleted: ()->
      for item in $rootScope.cartItemsArray when item.deleted
        delete $rootScope.cartItemsHash[item.build_id]
      rebuildArray()
    
    reset: ()->
      $rootScope.cartItemsHash = {}
      $rootScope.cartItemsArray = []
    
    totalQuantity: ()->
      quantity = 0
      for item in $rootScope.cartItemsArray
        quantity += item.quantity
      return quantity
    
    totalCents: ()->
      cents = 0
      for item in $rootScope.cartItemsArray
        cents += item.quantity * item.cents
      return cents
