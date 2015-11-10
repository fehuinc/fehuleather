$ ()->
  flash = $ "#flash"
      .delay 400
      .fadeIn 500
      .delay 6000
      .fadeOut 1000
      .on "mouseenter mousedown touchstart", ()->
        flash
          .clearQueue()
          .fadeOut 'fast'
        false
