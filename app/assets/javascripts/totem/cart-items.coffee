Take ["CartDB", "DOMContentLoaded"], (CartDB)->
  
  container = $ "shopping-cart .items"
  focussedId = null
  
  makeHtml = (item)->
    name     = "<div class='name'>#{item.short_name}</div>"
    quantity = "<div class='quantity'><input type='number' min='0' max='99' value='#{item.quantity}'></div>"
    price    = "<div class='price'>$#{(item.price_retail * item.quantity / 100)}</div>"
    deletedClass = if item.quantity > 0 then "" else "deleted"
    return "<div class='item #{deletedClass}' build-id='#{item.id}'>\n\t#{name}\n\t#{quantity}\n\t#{price}\n</div>"
  
  makeItemsHtml = (builds)->
    html = (makeHtml v for k,v of builds).join "\n"
    container.html html
    
    container.find(".quantity input").on "focus", (e)->
      elm = $(e.currentTarget)
      focussedId = elm.parents("[build-id]").attr "build-id"
    
    container.find(".quantity input").on "blur", (e)->
      elm = $(e.currentTarget)
      if focussedId is elm.parents("[build-id]").attr "build-id"
        focussedId = null
    
    container.find(".quantity input").on "change", (e)->
      setTimeout ()-> # Give the focus a chance to change
        elm = $(e.currentTarget)
        id = elm.parents("[build-id]").attr "build-id"
        build = CartDB.getBuildById(id)
        CartDB.setBuild build, elm.val()
      
  update = (builds, count)->
    container.empty() # Detaches event listeners, too :)
    if count > 0
      makeItemsHtml builds
      container.find("[build-id=#{focussedId}] input").focus()
    else
      container.html "<h3>Nothing yet... Commence shopping spree!</h3>"
  
  
  # INIT ##########################################################################################
  
  
  CartDB.addCallback update # Runs immediately
