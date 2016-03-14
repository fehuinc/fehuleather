Take ["CartDB", "DOMContentLoaded"], (CartDB)->

  update = (state, builds, count)->
    if count > 0
      q = CartDB.getQuantity()
      p = CartDB.getSubtotalCents()
      state.elm.html "<div class='subtotal'>#{q} items for $#{(p / 100)}</div>"
    else
      state.elm.empty()

  setup = (elm, i)->
    state =
      elm: $ elm
    
    # Init
    CartDB.addCallback (builds, count)-> # Runs immediately
      update state, builds, count

  # INIT ##########################################################################################
  
  setup elm, i for elm, i in $ ".cart-subtotal"
