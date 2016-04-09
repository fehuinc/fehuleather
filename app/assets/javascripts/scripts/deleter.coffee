Take "DOMContentLoaded", ()->
  setup = (elm)->
    isDown = false
    to = null
    
    kill = ()->
      elm.css "visibility", "hidden"
      $.ajax
        url: elm.attr "path"
        method: "DELETE"
        success: ()->
          window.location = elm.attr "redirect"
        error: ()->
          alert "Delete failed.. sorry hoo!"
          elm.css "visibility", "visible"
    
    down = (e)->
      if not isDown and e.button is 0
        isDown = true
        elm.addClass "deleting"
        to = setTimeout kill, 2000
    
    up = ()->
      if isDown
        isDown = false
        elm.removeClass "deleting"
        clearTimeout to
    
    # EVENT HANDLING
    elm.on "mousedown touchstart", down
    $(window).on "mouseup touchend", up
  
  
  # INIT ##########################################################################################
  
  
  for deleter in $ "deleter"
    setup $ deleter
