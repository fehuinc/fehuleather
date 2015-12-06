# STATE LOCAL TO THE PANEL WITHIN ONE PRODUCT

angular.module "TotemProductPanel", []

.directive "totemProductPanel", new Array "$rootScope", "$timeout", ($rootScope, $timeout)->
  controller: new Array "$scope", ($scope)->
    
    # This manipulates the DOM
    $scope.showCart = ()->
      document.body.scrollTop = 0 # Safari
      document.body.parentNode.scrollTop = 0 # FF, IE
      $timeout (()-> $rootScope.toggleCart true), 300
    
    $scope.checkChange = (variantIndex, variation)->
      $scope.setCenterSpecimen(variation.choiceIndex) if variantIndex is 0
      $scope.updateCurrentBuild()
