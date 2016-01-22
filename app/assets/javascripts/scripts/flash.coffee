$ ()->
  flash = $ "#flash"
      .delay 400
      .fadeIn 500
      .delay 1500
      .fadeOut 1500
      .on "mouseenter mousedown touchstart", ()->
        flash
          .clearQueue()
          .fadeOut 300
        false
