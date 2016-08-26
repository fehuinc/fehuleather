angular.module "Checkout", []

.controller "Checkout", new Array "$scope", ($scope)->
  $scope.submit = (valid)->
    window.location = "/payment"
