angular.module "PreviewCtrl", []

.controller "PreviewCtrl", new Array "Order", (Order)->
  Order.initItems FEHU.items
