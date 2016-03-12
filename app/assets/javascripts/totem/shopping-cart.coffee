Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  
  showingIcon = false
  shoppingCartElm = $ "shopping-cart"
  cartIconElm = shoppingCartElm.find ".icon"
  cartContentsElm = shoppingCartElm.find ".contents"
  
  
  hideCartAndIcon = ()->
    shoppingCartElm.hide()
  
  showCartAndIcon = ()->
    shoppingCartElm.show()
  
  update = (cart, count)->
    if count > 0 then showCartAndIcon() else hideCartAndIcon()
  
  toggleCartPanel = (bool)->
    cartContentsElm.toggleClass("showing", bool)
  
  # INIT ###########################################################################################

  Make "ShoppingCart", ShoppingCart =
    toggle: toggleCartPanel
  
  CartDB.addCallback update # Runs immediately
  shoppingCartElm.css "display", "block"
  shoppingCartElm.hide() if CartDB.isEmpty()
  cartIconElm.click (e)->
    toggleCartPanel()

  toggleCartPanel()
