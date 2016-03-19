Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  cad = $ ".cad"
  usd = $ ".usd"
  
  $("currency-selector").click ()->
    CartDB.toggleCurrency()
  
  CartDB.addCallback ()->
    if CartDB.getCurrency() is "CAD"
      cad.removeClass("hide")
      usd.addClass("hide")
    else
      cad.addClass("hide")
      usd.removeClass("hide")
