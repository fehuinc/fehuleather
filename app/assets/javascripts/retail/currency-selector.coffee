Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  cad = $ ".cad"
  usd = $ ".usd"
  
  $("currency-selector").click ()->
    CartDB.toggleCurrency()
  
  CartDB.addCallback ()->
    if CartDB.getCurrency() is "CAD"
      cad.addClass("hide")
      usd.removeClass("hide")
    else
      cad.removeClass("hide")
      usd.addClass("hide")
