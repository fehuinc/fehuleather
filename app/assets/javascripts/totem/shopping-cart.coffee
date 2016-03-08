Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  
  showingIcon = false
  cartIconElm = $ "shopping-cart"
  cartContentsElm = cartIconElm.find ".contents"
  
  
  hideCartIcon = ()->
    document.scrollTop = document.body.scrollTop -= cartIconElm.height()
    cartIconElm.hide()
  
  showCartIcon = ()->
    document.scrollTop = document.body.scrollTop += cartIconElm.height()
    cartIconElm.show()
  
  update = (cart, count)->
    if count > 0 then showCartIcon() else hideCartIcon()
  
  toggleCartPanel = ()->
    toggleCartPanel
  
  # INIT ###########################################################################################
  
  CartDB.addCallback update
  cartIconElm.css "display", "block"
  cartIconElm.hide()
  cartContentsElm.hide()
  cartIconElm.click (e)->
    toggleCartPanel()
