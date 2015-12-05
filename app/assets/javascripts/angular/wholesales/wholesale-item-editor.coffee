angular.module "WholesaleItemEditor", []

.directive "wholesaleItemEditor", new Array "$timeout", ($timeout)->
  scope: true
  controller: new Array "$scope", ($scope)->
    $scope.item =
      quantity: 0
      displayQuantity: 0
      # id is set in the view

    # ANIMATION ###################################################################################
    animating = false
    
    doAnimate = ()->
      diff = $scope.item.quantity - $scope.item.displayQuantity
      if diff > 0
        $scope.item.displayQuantity++
      else if diff < 0
        $scope.item.displayQuantity--
      
      if diff isnt 0
        $timeout(doAnimate, 100 / Math.abs(diff))
      else
        animating = false
        
    animate = ()->
      if not animating
        animating = true
        $timeout(doAnimate, 10)
    
    
    # SCOPE #######################################################################################
    
    $scope.updateQuantity = ()->
      $scope.item.quantity = Math.max(0, $scope.item.quantity)
      animate()
      # CurrentOrder.updateItem($scope.item)
    
    $scope.changeQuantity = (delta)->
      $scope.item.quantity += delta
      $scope.updateQuantity()
      
