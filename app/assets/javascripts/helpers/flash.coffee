$ ()->
  flash = $ "#flash"
  if flash.length
    flash
      .fadeIn 500
      .delay 6000
      .fadeOut 1000
      .on "mouseenter mousedown touchstart", ()->
        flash.clearQueue().fadeOut 'fast'
        false
