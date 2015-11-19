# STATE LOCAL TO ONE SPECIMEN

angular.module "TotemSpecimen", []

.directive "totemSpecimen", new Array "PanelManager", (PanelManager)->
  controller: new Array "$scope", ($scope)->
    
    $scope.clickSpecimen = (product, specimen)->
      
      if SpecimenManager.isCurrentSpecimen product, specimen
        # We clicked the current specimen — toggle the panel
        PanelManager.togglePanel product
      
      else
        # The specimen was off to the side — scroll it into view
        SpecimenManager.setCurrentSpecimen specimen
        
        throw I AM HERE
        
