# STATE SHARED BY ALL SPECIMENS AND INFO WITHIN ONE PRODUCT

angular.module "TotemProduct", []

.directive "totemProduct", ()->
  controller: new Array "$scope", ($scope)->
