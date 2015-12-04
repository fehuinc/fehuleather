# STATE SHARED BY ALL SPECIMENS AND INFO WITHIN ONE PRODUCT

angular.module "TotemProduct", []

.directive "totemProduct", new Array "BuildHasher", (BuildHasher)->
  controller: new Array "$scope", ($scope)->
    centerSpecimenIndex = 0
    $scope.offset = 0
    $scope.currentBuild = null
    
    $scope.updateCurrentBuild = ()->
      $scope.currentBuild = BuildHasher.buildFromProductChoices $scope.product
    
    $scope.isCenterSpecimen = (index)->
      index is centerSpecimenIndex
    
    $scope.setCenterSpecimen = (index)->
      $scope.offset -= index - centerSpecimenIndex
      centerSpecimenIndex = index
      
      # Update the first variation's <select> to match the selected specimen
      firstVariation = $scope.product.variations[0]
      firstVariation.choiceIndex = centerSpecimenIndex % firstVariation.variants.length
      
    # INIT
    $scope.updateCurrentBuild()
