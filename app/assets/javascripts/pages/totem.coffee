Take "DOMContentLoaded", ()->
  slideDecay = 20
  epsilon = 0.01
  
  $("totem-row").each (rowIndex, _rowElm)->
    
    rowElm = $ _rowElm
    inputLayer = rowElm.find "input-layer"
    slidingLayer = rowElm.find "sliding-layer"
    totemItems = rowElm.find "totem-item"
    
    vminPx = 0
    panelOpen = false
    slideOffsetUnits = 0
    slideOffsetPx = 0
    slidingLayerWidthPx = 0
    itemData = $.map totemItems, (item, i)-> { i:i, octave: 0 }
    
    updateVminPx = ()->
      vminPx = Math.min(window.innerWidth, window.innerHeight) / 100
      slidingLayerWidthPx = totemItems.length * 82 * vminPx
    
    updateItemPositions = ()->
      totemItems.each (i, _item)->
        item = $ _item
        data = itemData[i]
        
        x = data.i * 82 * vminPx + data.octave * slidingLayerWidthPx
        screenX = x + slideOffsetPx
        
        if Math.abs(screenX) > slidingLayerWidthPx/2
          data.octave += if screenX > 0 then -1 else 1
          x = data.i * 82 * vminPx + data.octave * slidingLayerWidthPx
          screenX = x + slideOffsetPx
        
        opacity = 1 - Math.abs(screenX) / (82 * vminPx * 2)
        opacity = Math.round(opacity*100)/100 # Eliminate rounding error weirdness
        show = opacity >= 0
        if show
          item.css "display", "block"
          item.css "opacity", opacity
          item.css "transform", "translateX(#{x}px)"
        else
          item.css "display", "none"
          item.css "opacity", ""
          item.css "transform", ""
    
    updateSlideOffset = ()->
      slideOffsetPx = slideOffsetUnits * 82 * vminPx
      slidingLayer.css "transform", "translateX(#{slideOffsetPx}px)"
      updateItemPositions()
    
    slideBy = (delta)->
      slideOffsetUnits -= delta
      updateSlideOffset()
    
    togglePanelOpen = ()->
      # if panelOpen = !panelOpen
      
    updateAll = ()->
      updateVminPx()
      updateSlideOffset()
    
    # When we click the input layer, decide what to do
    inputLayer.click (e)->
      clickVmin = (e.clientX - window.innerWidth/2) / vminPx
      absClickVmin = Math.abs(clickVmin)
      if absClickVmin < 41
        togglePanelOpen()
      else
        slideBy(clickVmin / absClickVmin)
    
    # Update whenever the window is resized
    $(window).resize updateAll
        
    # Initialize
    updateAll()
