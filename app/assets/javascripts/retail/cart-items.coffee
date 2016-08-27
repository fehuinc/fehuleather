Take ["CartDB", "DOMContentLoaded"], (CartDB, Validator)->
  makeItemHtml = (item)->
    image    = "<div class='image'><img src='#{item.variation.wholesale_image or ''}'></div>"
    name     = "<div class='name'>#{item.short_name}</div>"
    quantity = "<div class='quantity'><input type='number' min='0' max='#{item.stock}' step='1' value='#{item.quantity}'></div>"
    price    = "<div class='price'>$#{item.retail_prices[CartDB.getCurrency()] *  item.quantity}</div>"
    deletedClass = if item.quantity > 0 then "" else "deleted"
    return "<div class='item #{deletedClass}' build-id='#{item.id}'>\n\t#{image}\n\t#{name}\n\t#{quantity}\n\t#{price}\n</div>"
  
  makeItemsHtml = (state, builds)->
    html = (makeItemHtml v for k,v of builds).join "\n"
    state.container.html html
    
    state.container.find(".quantity input").on "focus", (e)->
      elm = $(e.currentTarget)
      state.focussedId = elm.parents("[build-id]").attr "build-id"
    
    state.container.find(".quantity input").on "blur", (e)->
      elm = $(e.currentTarget)
      if state.focussedId is elm.parents("[build-id]").attr "build-id"
        state.focussedId = null
    
    state.container.find(".quantity input").on "change", (e)->
      setTimeout ()-> # Give the focus a chance to change
        elm = $(e.currentTarget)
        id = elm.parents("[build-id]").attr "build-id"
        build = CartDB.getBuildById(id)
        val = Math.max 0, Math.min build.stock, Math.round elm.val()
        CartDB.setBuild build, val
  
  update = (state, builds, count)->
    state.container.empty() # Detaches event listeners, too :)
    if count > 0
      makeItemsHtml state, builds
      state.container.find("[build-id=#{state.focussedId}] input").focus()
    else
      state.container.html "<h3>Nothing yet... Commence shopping spree!</h3>"
  
  setup = (containerElm, i)->
    state =
      container: $ containerElm
      focussedId: null
    
    # Init
    CartDB.addCallback (builds, count)-> # Runs immediately
      update state, builds, count
  
  # INIT ##########################################################################################
  
  setup elm, i for elm, i in $ ".cart-items"
