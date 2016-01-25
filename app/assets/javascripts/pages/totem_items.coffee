$ ()->
  if $("body.totem_items")
    
    update = ()->
      if $("[variation-select]").val() > 0
        $("[manual-entry]").hide()
      else
        $("[manual-entry]").show()
    
    $("[variation-select]").change(update)
    update()
