angular.module "PreviewCtrl", []

.controller "PreviewCtrl", new Array "WholesaleOrder", (WholesaleOrder)->
  WholesaleOrder.initItems FEHU.items.map (item)->
    item.image = item.wholesale_image
    item
