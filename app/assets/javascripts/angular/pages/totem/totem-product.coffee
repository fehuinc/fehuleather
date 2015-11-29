# STATE SHARED BY ALL SPECIMENS AND INFO WITHIN ONE PRODUCT

angular.module "TotemProduct", []

.directive "totemProduct", ()->
  controller: new Array "$scope", ($scope)->
    centerSpecimenIndex = 0
    $scope.offset = 0
    
    $scope.isCenterSpecimen = (index)->
      index is centerSpecimenIndex
    
    $scope.setCenterSpecimen = (index)->
      $scope.offset -= index - centerSpecimenIndex
      centerSpecimenIndex = index
    
    # We might want this for the Panel, later, to determine which variant is selected
    # $scope.getCenterSpecimen = (index)->
    #   $scope.product.specimens[index]
