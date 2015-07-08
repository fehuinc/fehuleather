$ ()->
  flash = $ "#flash"
  if flash.length
    flash
      .on "mouseenter mousedown touchstart", ()->
        flash.fadeOut "slow"
        false
      .delay 200
      .fadeIn 1200
      .delay 5000
      .fadeOut 1200
