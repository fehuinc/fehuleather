angular.module "PreviewCtrl", []

.controller "PreviewCtrl", new Array "WholesaleOrder", (WholesaleOrder)->
  WholesaleOrder.initItems FEHU.orderItems
