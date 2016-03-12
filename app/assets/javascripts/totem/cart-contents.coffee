Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  
  container = $ "shopping-cart .items"
  
  makeHtml = (item)->
    console.log item
    name     = "<div class='name'>#{item.full_name}</div>"
    quantity = "<div class='quantity'><input type='number' min='0' max='99'></div>"
    price    = "<div class='price'>$#{item.price_retail}</div>"
    remove   = "<div class='remove'><div>x</div></div>"
    html = "<div class='item'>\n\t#{name}\n\t#{quantity}\n\t#{price}\n\t#{remove}\n</div>"
    return html
  
  update = (builds, count)->
    
    container.empty() # Detaches event listeners, too :)
    
    if count > 0
      htmlItems = (makeHtml v for k,v of builds)
      container.html htmlItems.join "\n"
      container.find(".remove") # ATTACH EVENT STUFF
    
    else
      container.html "<h3>Nothing yet... Commence shopping spree!</h3>"
  
  
  # INIT ##########################################################################################
  
  
  CartDB.addCallback update # Runs immediately
