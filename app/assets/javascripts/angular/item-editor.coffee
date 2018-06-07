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
      else
        $scope.editorBuild.displayQuantity = $scope.editorBuild.quantity

      if diff isnt 0
        $timeout(doAnimate, 200 / Math.abs(diff))
      else
        animating = false

    animate = ()->
      if not animating
        animating = true
        doAnimate()


    # SCOPE #######################################################################################

    $scope.initQuantity = (quantity)->
      $scope.editorBuild.displayQuantity = $scope.editorBuild.quantity = quantity

    $scope.updateQuantity = (quantity)->
      return if !quantity? or isNaN quantity
      $scope.editorBuild.quantity = Math.max 0, quantity
      animate()
      WholesaleOrder.update $scope.editorBuild

    $scope.adjustQuantity = (delta)->
      $scope.updateQuantity $scope.editorBuild.quantity + delta

    $scope.changeQuantity = ()->
      $scope.updateQuantity $scope.editorBuild.displayQuantity

    $scope.blurQuantity = ()->
      $scope.updateQuantity $scope.editorBuild.displayQuantity or 0
