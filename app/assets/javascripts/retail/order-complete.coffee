Take "CartDB", (CartDB)->
  
  if $("#order_complete").length > 0
    CartDB.clear()
    id = window.location.pathname.split("/").pop()
    window.location = "/orders/#{id}"
