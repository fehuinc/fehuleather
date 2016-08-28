Take ["CartDB", "ShoppingCart", "DOMContentLoaded"], (CartDB, ShoppingCart)->
  
  addToCart = (state, build)->
    CartDB.setBuild build, 1
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
    inStock = state.selectedSize.build.stock > 0
    inCart = CartDB.hasBuild state.selectedSize.build
    showIf state.addToBag, inStock and not inCart
    showIf state.inTheBag, inCart
    showIf state.outOfStock, not inStock and not inCart # If it's gone out of stock since they added it, we'll deal with that during checkout
    
    for b in state.sizeButtons
      button = $ b
      build = extractBuildData button
      button.toggleClass "in-bag", CartDB.hasBuild build
    
    if state.selectedSize?.build? # Will be undefined if retail feature flag is false
      state.price.text state.selectedSize.build.retail_prices[CartDB.getCurrency()]
    
    return state

  
  # SETUP #########################################################################################
  
  
  setup = (panelElm, i)->
    panel = $ panelElm
    
    state =
      selectedSize: {}
      sizeButtons: panel.find "[js-build]"
      addToBag: panel.find ".add-to-bag"
      inTheBag: panel.find ".in-the-bag"
      outOfStock: panel.find ".out-of-stock"
      price: panel.find "[js-price]"
    
    # Init
    render setSelectedSize state, state.sizeButtons.first() if state.sizeButtons.length # There are no size buttons if the retail feature flag is false
    state.sizeButtons.click (e)-> render setSelectedSize state, $(e.currentTarget)
    state.addToBag.click (e)-> render addToCart state, state.selectedSize.build
    panel.find("[js-bag-link]").click scrollToCart
    CartDB.addCallback ()-> render state
    
    
  # INIT ##########################################################################################
  setup panelElm, i for panelElm, i in $ "totem-panel"
