Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  
  showingIcon = false
  cartIconElm = $ "shopping-cart"
  cartContentsElm = cartIconElm.find ".contents"
  
  
  hideCartIcon = ()->
    cartIconElm.hide()
  
  showCartIcon = ()->
    cartIconElm.show()
  
  update = (cart, count)->
    if count > 0 then showCartIcon() else hideCartIcon()
  
  toggleCartPanel = (bool)->
    cartContentsElm.toggleClass("showing", bool)
  
  # INIT ###########################################################################################

  Make "ShoppingCart", ShoppingCart =
    toggle: toggleCartPanel
  
  CartDB.addCallback update # Runs immediately
  cartIconElm.css "display", "block"
  cartIconElm.hide() if CartDB.isEmpty()
  cartIconElm.click (e)->
    toggleCartPanel()
