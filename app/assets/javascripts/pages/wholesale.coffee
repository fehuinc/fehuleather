angular.module "Wholesale", []

.controller "WholesaleCtrl", (Products, $scope)->
  $scope.products = Products.all()
