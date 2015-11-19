angular.module "TotemProduct", []

.directive "totemProduct", ()->
  controller: new Array "$scope", ($scope)->

    ## LOCALS
    productIndex = $scope.$index
    
    
    ## HELPERS
    getSpecimenIndex = (rawIndex)->
      specimens = $scope.product.specimens
      return (rawIndex + specimens.length) % specimens.length
    
    getSpecimen = (specimenIndex)->
      return $scope.product.specimens[specimenIndex]
    
    
    ## SCOPE
    $scope.specimensCount = ()->
      return $scope.product.specimens.length

    $scope.getTotemImage = (rawIndex)->
      return getSpecimen(getSpecimenIndex(rawIndex))?.totem

    $scope.getVerticalPositionStyle = ()->
      ypos = if $scope.isProductOpen(productIndex) then $scope.product.ypos else 0
      translate = "translate(-50%, -#{ypos}%)"
      return style =
        transform: translate
        "-webkit-transform": translate

    $scope.changeSpecimen = (rawIndex)->
      specimenIndex = getSpecimenIndex(rawIndex)
      $scope.specimen = getSpecimen(specimenIndex)
      variation = $scope.product.variations[0]
      variation.choiceIndex = specimenIndex
      variation.choice = variation.variants[specimenIndex]

    $scope.checkChange = (variationIndex)->
      if variationIndex is 0
        $scope.requestSpecimen($scope.product.variations[0].choiceIndex)
      else
        variation = $scope.product.variations[variationIndex]
        variation.choice = variation.variants[variation.choiceIndex]
    
    # SETUP
    
    # We need to do this, or the description doesn't show
    $scope.changeSpecimen(0)
