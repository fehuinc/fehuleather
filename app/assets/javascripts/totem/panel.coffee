Take ["CartDB", "ShoppingCart", "DOMContentLoaded"], (CartDB, ShoppingCart)->
  
  addToCart = (state, buildID)->
    CartDB.addItem(buildID)
    return state
  
  setSelectedSize = (state, sizeElm)->
    state.selectedSize.elm?.removeClass "selected"
    sizeElm.addClass "selected"
    state.selectedSize =
      elm: sizeElm
      id: sizeElm.attr "js-build"
    return state
  
  
  scrollToCart = (e)->
    time = Math.sqrt(document.body.scrollTop) * 20
    $("html,body").animate {scrollTop: 0}, time, 'swing', ()-> ShoppingCart.toggle true
  
  # RENDERING #####################################################################################
  
  
  showIf = (elm, bool)->
    if bool then elm.show() else elm.hide()
  
  
  render = (state)->
    showIf state.addToBag, !CartDB.hasItem state.selectedSize.id
    showIf state.inTheBag, CartDB.hasItem state.selectedSize.id
    
    for b in state.sizeButtons
      button = $ b
      button.toggleClass "in-bag", CartDB.hasItem(button.attr "js-build")
    
    return state

  
  # SETUP #########################################################################################
  
  
  setup = (panelElm, i)->
    panel = $ panelElm
    
    state =
      selectedSize: {}
      sizeButtons: panel.find "[js-build]"
      addToBag: panel.find ".add-to-bag"
      inTheBag: panel.find ".in-the-bag"
    
    # Init
    state.sizeButtons.click (e)-> render setSelectedSize state, $(e.currentTarget)
    state.addToBag.click (e)-> render addToCart state, state.selectedSize.id
    panel.find("[js-bag-link]").click scrollToCart
    render setSelectedSize state, state.sizeButtons.first() if state.sizeButtons.length > 0
    # if "[js-build=13]"
    #   render addToCart state, 13
      
    
  # INIT ##########################################################################################
  setup panelElm, i for panelElm, i in $("totem-panel")
  
