# STATE LOCAL TO ONE SPECIMEN

angular.module "TotemSpecimen", []

.directive "totemSpecimen", new Array "PanelManager", (PanelManager)->
  controller: new Array "$scope", ($scope)->
    SIZE_WITH_PAD = 82
    animationTime = 800
    
    
    getPosition = (pos, length)->
      # Wraps positions to negative at the midpoint of the length, centered around 0, biased negative
      # Should turn positions 0 1 2 3 4 5 6 into 0 1 2 3 -3 -2 -1, and 0 1 2 3 4 5 into 0 1 2 -3 -2 -1
      # This will maintain an even spread of totems around 0
      (((pos + length) + length/2) % length) - length/2
    
    getTransform = (position)->
      # TODO: This won't necessarily update on resize
      if document.querySelector("html.wide")?
        return "translate(#{position * SIZE_WITH_PAD}vh)"
      else
        return "translate(#{position * SIZE_WITH_PAD}vw)"
    
    getOpacity = (position)->
      switch Math.abs position
        when 0 then 1
        when 1 then 0.2
        else 0
    
    $scope.getSpecimenStyle = ()->
      position = getPosition $scope.offset + $scope.$index, $scope.product.specimens.length
      return style =
        transform: getTransform position
        opacity: getOpacity position
      
    
    $scope.clickSpecimen = ()->
      if $scope.isCenterSpecimen $scope.$index
        # We clicked the center specimen — toggle the panel
        PanelManager.togglePanel $scope.product
      else
        # The specimen we clicked was off to the side — scroll it into view
        $scope.setCenterSpecimen $scope.$index
