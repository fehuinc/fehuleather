$ ()->
  
  sendUpdate = (productID, builds)->
    $.ajax
      url: "/wholesale/order/product/" + productID
      method: "PATCH"
      data: builds: builds
    .done (r)->
      location.reload()
    .fail (r)->
      alert "An Error Occurred"
      console.log r.responseText.split("\n")[0..2]

  
  
  if $("body.orders").length
    productID = $("[product-id]").attr("product-id")
    
    $(".update-order .button").hide()
    
    $(".quantity .button").on "click", (e)->
      button = $ e.target
      field = button.closest(".quantity").find "input"
      delta = parseInt button.attr "delta"
      currentValue = parseInt field.prop "value"
      newVal = Math.max 0, currentValue + delta
      field.prop "value", newVal
      
      $(".update-order .button").show()
    
    $(".update-order .button").on "click", (e)->
      e.preventDefault()
      builds = {}
      
      $(".order-builder input.quantity").each (i, elm)->
        cid = $(elm).attr("cid")
        quantity = $(elm).prop("value")
        if quantity > 0
          builds[cid] =
            id: cid
            quantity: quantity
          sendUpdate productID, builds
    
    $("[remove-item]").on "click", (e)->
      cid = $(e.target).attr("remove-item")
      builds = {}
      builds[cid] =
        id: cid
        quantity: 0
      sendUpdate productID, builds
      
