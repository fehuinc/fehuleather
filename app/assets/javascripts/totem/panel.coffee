Take ["CartDB", "ShoppingCart", "DOMContentLoaded"], (CartDB, ShoppingCart)->
  
  addToCart = (state, build)->
    CartDB.addBuild(build)
    return state
  
  extractBuildData = (elm)->
    JSON.parse elm.attr "js-build"
  
  setSelectedSize = (state, sizeElm)->
    state.selectedSize.elm?.removeClass "selected"
    sizeElm.addClass "selected"
    state.selectedSize =
      elm: sizeElm
      build: extractBuildData sizeElm
    return state
  
  
  scrollToCart = (e)->
    time = Math.sqrt(document.body.scrollTop) * 20
    $("html,body").animate {scrollTop: 0}, time, 'swing', ()-> ShoppingCart.toggle true
  
  # RENDERING #####################################################################################
  
  
  showIf = (elm, bool)->
    if bool then elm.show() else elm.hide()
  
  
  render = (state)->
    showIf state.addToBag, not CartDB.hasBuild state.selectedSize.build
    showIf state.inTheBag,     CartDB.hasBuild state.selectedSize.build
    
    for b in state.sizeButtons
      button = $ b
      build = extractBuildData button
      button.toggleClass "in-bag", CartDB.hasBuild build
    
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
    render setSelectedSize state, state.sizeButtons.first()
    state.sizeButtons.click (e)-> render setSelectedSize state, $(e.currentTarget)
    state.addToBag.click (e)-> render addToCart state, state.selectedSize.build
    panel.find("[js-bag-link]").click scrollToCart
    # if "[js-build=13]"
    #   render addToCart state, 13
    
  # INIT ##########################################################################################
  setup panelElm, i for panelElm, i in $("totem-panel")
  
