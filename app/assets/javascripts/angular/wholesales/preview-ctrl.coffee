angular.module "PreviewCtrl", []

.controller "PreviewCtrl", new Array "Order", (Order)->
  Order.initItems FEHU.items.map (item)->
    item.image = item.wholesale_image
    item
