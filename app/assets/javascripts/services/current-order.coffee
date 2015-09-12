angular.module "CurrentOrder", []

.service "CurrentOrder", new Array "$rootScope", ($rootScope)->
  $rootScope.currentOrder = {}
  
  CurrentOrder =
    setQuantity: (id, quantity)->
      $rootScope.currentOrder[id] =
        quantity: quantity
