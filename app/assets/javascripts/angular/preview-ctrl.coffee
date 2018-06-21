angular.module "PreviewCtrl", []

.controller "PreviewCtrl", new Array "WholesaleOrder", "$scope", (WholesaleOrder, $scope)->
  WholesaleOrder.initItems FEHU.orderItems

  $scope.remove = (item)->
    item.quantity = 0
    WholesaleOrder.update item
