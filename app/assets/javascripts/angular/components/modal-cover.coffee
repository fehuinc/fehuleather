angular.module "ModalCover", []

.directive "modalCover", new Array "$rootScope", ($rootScope)->
  scope: true
  
  controller: new Array "$scope", ($scope)->
    
    $scope.showingModalCover = false
    
    $rootScope.toggleModalCover = (clickCallback, doShow)->
      $scope.click = clickCallback
      $scope.showingModalCover = doShow ?= not $scope.showingModalCover
