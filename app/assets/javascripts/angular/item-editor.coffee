angular.module "ItemEditor", []

.directive "itemEditor", new Array "WholesaleOrder", "$timeout", (WholesaleOrder, $timeout)->
  scope: true
  controller: new Array "$scope", ($scope)->
    $scope.editorBuild = {} # properties are set in the view
    
    # ANIMATION ###################################################################################
    animating = false
    
    doAnimate = ()->
      diff = $scope.editorBuild.quantity - $scope.editorBuild.displayQuantity
      if diff > 0
        $scope.editorBuild.displayQuantity++
      else if diff < 0
        $scope.editorBuild.displayQuantity--
      
      if diff isnt 0
        $timeout(doAnimate, 200 / Math.abs(diff))
      else
        animating = false
        
    animate = ()->
      if not animating
        animating = true
        doAnimate()
    
    
    # SCOPE #######################################################################################
    
    $scope.setQuantity = (quantity)->
      $scope.editorBuild.displayQuantity = $scope.editorBuild.quantity = quantity
    
    $scope.updateQuantity = ()->
      $scope.editorBuild.quantity = Math.max(0, $scope.editorBuild.quantity)
      animate()
      WholesaleOrder.update $scope.editorBuild
    
    $scope.changeQuantity = (delta)->
      $scope.editorBuild.quantity += delta
      $scope.updateQuantity()
    
