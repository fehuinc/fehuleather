Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  
  container = $ "shopping-cart .items"
  
  makeHtml = (item)->
    name     = "<div class='name'>#{item.full_name}</div>"
    quantity = "<div class='quantity'><input type='number' min='0' max='99'></div>"
    price    = "<div class='price'>$#{item.price_retail}</div>"
    remove   = "<div class='remove'><div>x</div></div>"
    return "<div class='item'>\n\t#{name}\n\t#{quantity}\n\t#{price}\n\t#{remove}\n</div>"
  
  update = ()->
    items = CartDB.getBuild()
    
    container.find(".item").remove() # This detaches event listeners
    
    htmlItems = (makeHtml item for item in items)
    container.html htmlItems.join "\n"
    
    container.find(".remove") # ATTACH EVENT STUFF
  
  CartDB.addCallback update
