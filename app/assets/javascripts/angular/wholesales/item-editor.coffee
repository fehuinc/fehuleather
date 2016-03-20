angular.module "ItemEditor", []

.directive "itemEditor", new Array "WholesaleOrder", "$timeout", (WholesaleOrder, $timeout)->
  scope: true
  controller: new Array "$scope", ($scope)->
    $scope.editorItem = {} # properties are set in the view

    # ANIMATION ###################################################################################
    animating = false
    
    doAnimate = ()->
      diff = $scope.editorItem.quantity - $scope.editorItem.displayQuantity
      if diff > 0
        $scope.editorItem.displayQuantity++
      else if diff < 0
        $scope.editorItem.displayQuantity--
      
      if diff isnt 0
        $timeout(doAnimate, 100 / Math.abs(diff))
      else
        animating = false
        
    animate = ()->
      if not animating
        animating = true
        $timeout(doAnimate, 10)
    
    
    # SCOPE #######################################################################################
    
    $scope.setQuantity = (quantity)->
      $scope.editorItem.displayQuantity = $scope.editorItem.quantity = quantity
    
    $scope.updateQuantity = ()->
      $scope.editorItem.quantity = Math.max(0, $scope.editorItem.quantity)
      animate()
      WholesaleOrder.update $scope.editorItem
    
    $scope.changeQuantity = (delta)->
      $scope.editorItem.quantity += delta
      $scope.updateQuantity()
    
