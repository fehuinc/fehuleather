# STATE SHARED BY ALL PANELS

angular.module "PanelManager", []

.service "PanelManager", ()->
  showingPanelForProduct = null
  
  return PanelManager
    closePanel: ()->
      showingPanelForProduct = null
    
    openPanel: (product)->
      showingPanelForProduct = product
    
    togglePanel: (product)->
      if PanelManager.isPanelOpen product
        PanelManager.closePanel()
      else
        PanelManager.openPanel product
    
    getCurrentPanelProduct: ()->
      return showingPanelForProduct
      
    isPanelOpen: (product)->
      return showingPanelForProduct is product
