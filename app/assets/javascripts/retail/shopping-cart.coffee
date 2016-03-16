Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  
  showingIcon = false
  shoppingCartElm = $ "shopping-cart"
  cartIconElm = shoppingCartElm.find ".icon"
  cartContentsElm = shoppingCartElm.find ".contents"
  
  
  hideCartAndIcon = ()->
    toggleCartPanel(false)
    shoppingCartElm.hide()
  
  showCartAndIcon = ()->
    shoppingCartElm.show()
  
  update = (cart, count)->
    if count > 0 then showCartAndIcon() else hideCartAndIcon()
  
  toggleCartPanel = (bool)->
    $("body").toggleClass "showing-cart", bool
    
    if $("body").hasClass "showing-cart"
      
      $("modal-cover").on "click", ()->
        console.log $ "modal-cover"
        toggleCartPanel(false)
    else
      $("modal-cover").off "click", toggleCartPanel
  
  
  # INIT ###########################################################################################
  
  
  Make "ShoppingCart", ShoppingCart =
    toggle: toggleCartPanel
  
  CartDB.addCallback update # Runs immediately
  shoppingCartElm.css "display", "block"
  shoppingCartElm.hide() if CartDB.isEmpty()
  cartIconElm.click (e)->
    toggleCartPanel()
  
  shoppingCartElm.find(".clear").click ()->
    CartDB.clear()
