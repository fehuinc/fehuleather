Take ["Cart", "DOMContentLoaded"], (Cart)->
  
  setSelectedSize = (state, sizeElm)->
    state.selectedSize.elm?.removeClass "selected"
    sizeElm.addClass "selected"
    state.selectedSize =
      elm: sizeElm
      id: sizeElm.attr "js-build"
  
  
  # SETUP #########################################################################################
  
  
  setup = (panelElm, i)->
    panel = $ panelElm
    
    state =
      selectedSize: {}
      sizeButtons: panel.find("[js-build]")
    
    
    state.sizeButtons.click (e)-> setSelectedSize state, $(e.currentTarget)
    setSelectedSize state, state.sizeButtons.first()
  
  
  # INIT ##########################################################################################
  setup panelElm, i for panelElm, i in $("totem-panel")
