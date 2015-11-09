angular.module "CurrentOrder", []

.service "CurrentOrder", new Array "$rootScope", ($rootScope)->
  $rootScope.currentOrder = {}
  
  CurrentOrder =
    updateItem: (item)->
      $rootScope.currentOrder[item.id] = item
