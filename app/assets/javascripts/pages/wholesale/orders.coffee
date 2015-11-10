$ ()->
  
  sendUpdate = (productID, configurations)->
    $.ajax
      url: "/wholesale/order/product/" + productID
      method: "PATCH"
      data: configurations: configurations
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
      configurations = {}
      
      $(".order-builder input.quantity").each (i, elm)->
        cid = $(elm).attr("cid")
        quantity = $(elm).prop("value")
        if quantity > 0
          configurations[cid] =
            id: cid
            quantity: quantity
          sendUpdate productID, configurations
    
    $("[remove-item]").on "click", (e)->
      cid = $(e.target).attr("remove-item")
      configurations = {}
      configurations[cid] =
        id: cid
        quantity: 0
      sendUpdate productID, configurations
      
