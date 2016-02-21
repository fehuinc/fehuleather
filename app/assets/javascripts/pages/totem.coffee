$ ()->
  
  PANEL_OPEN_CENTER_POS = 30 # panelClosedCenterPos would be 50
  TILE_SIZE = 82
  
  
  fixFloatError = (i)->
    Math.round(i*1000)/1000
  
  
  updateItemX = (state, item)->
    item.x = item.i * state.tileSizePx + item.octave * state.sliderWidthPx
    item.screenX = fixFloatError item.x + state.offsetX
    item.absScreenX = Math.abs item.screenX
  
  
  wrapItemToScreen = (state, item)->
    if item.absScreenX > state.sliderWidthPx/2
      item.octave -= item.screenX / item.absScreenX
      updateItemX state, item
  
  
  updateItemList = (state)->
    for item in state.itemList
      updateItemX state, item
      wrapItemToScreen state, item
  
  
  updateCurrentItem = (state)->
    closestDistance = Infinity
    for item, i in state.itemList
      if item.absScreenX < closestDistance
        closestDistance = item.absScreenX
        state.currentItem = item
  
  
  updateSliderOffset = (state)->
    state.offsetX = state.offsetUnits * state.tileSizePx
    updateItemList state
    updateCurrentItem state
  
  
  slideByUnits = (state, deltaUnits)->
    state.offsetUnits = state.offsetUnits - deltaUnits
    updateSliderOffset state
    
    
  togglePanel = (state)->
    state.isPanelOpen = !state.isPanelOpen
    if state.isPanelOpen
      deltaPos = state.currentItem.ypos - PANEL_OPEN_CENTER_POS
      deltaPx = state.tileSizePx * deltaPos/100
      state.offsetY = -deltaPx
    else
      state.offsetY = 0
  
  
  clickAction = (clientX)->
    clickVmin = (clientX - window.innerWidth/2) / state.vminPx
    absClickVmin = Math.abs clickVmin
    if absClickVmin > TILE_SIZE/2
      slideByUnits state, clickVmin / absClickVmin
    else
      togglePanel state
    state.isTransitioning = true

  
  # EVENTS ########################################################################################
  
  
  
  resize = (state)->
    state.vminPx = Math.min(window.innerWidth, window.innerHeight) / 100
    state.tileSizePx = TILE_SIZE * state.vminPx
    state.sliderWidthPx = state.itemList.length * state.tileSizePx
    updateSliderOffset state
    state.isTransitioning = false
    resizeRender state
    return state
  
  
  click = (state, clientX)->
    clickAction(clientX) if state.blockClickTime < Date.now() - 310
    return state
  
  
  touchstart = (state, e)->
    touchPoint = e.originalEvent.touches[0]
    state.offsetXStart = state.offsetX
    state.isScrolling = state.isSliding = false
    state.touchCurrent.x = state.touchPrevious.x = state.touchStart.x = touchPoint.screenX
    state.touchCurrent.y = state.touchPrevious.y = state.touchStart.y = touchPoint.screenY
    return state
  
  
  touchmove = (state, e)->
    state.e = e
    touchPoint = e.originalEvent.touches[0]
    state.touchPrevious.x = state.touchCurrent.x
    state.touchPrevious.y = state.touchCurrent.y
    state.touchCurrent.x = touchPoint.screenX
    state.touchCurrent.y = touchPoint.screenY
    unless state.isSliding or state.isScrolling
      xDelta = Math.abs state.touchCurrent.x - state.touchStart.x
      yDelta = Math.abs state.touchCurrent.y - state.touchStart.y
      state.isSliding =   xDelta > 10 and xDelta > yDelta
      state.isScrolling = yDelta > 10 and xDelta < yDelta
    if state.isSliding
      state.offsetX = state.offsetXStart + state.touchCurrent.x - state.touchStart.x
      state.offsetUnits = Math.round state.offsetX / state.tileSizePx
      updateItemList state
      updateCurrentItem state
    state.isTransitioning = !state.isSliding
    return state
  
  
  touchend = (state, e)->
    state.blockClickTime = Date.now()
    if state.isSliding
      previousDeltaPx = state.touchCurrent.x - state.touchPrevious.x
      totalDeltaUnits = -Math.round (state.offsetXStart - state.touchStart.x) / state.tileSizePx
      
      if previousDeltaPx > state.tileSizePx/10 and totalDeltaUnits >= 0
        slideByUnits state, -1
      else if previousDeltaPx < -state.tileSizePx/10 and totalDeltaUnits <= 0
        slideByUnits state, 1
      else
        updateSliderOffset state
      state.isTransitioning = true
    else if not state.isScrolling
      clickAction state.touchStart.x
    return state
    
    
  # RENDERING #####################################################################################
  
  resizeRender = (state)->
    for item in state.itemList
      item.elm.css("margin-left", (window.innerWidth/2 - 40 * state.vminPx) + "px" )
      item.imageElm.width(80 * state.vminPx).height(80 * state.vminPx)
    state.slider.height(80 * state.vminPx)
    state.clipper.height(80 * state.vminPx)
    state.row.height(80 * state.vminPx).css("margin", "#{2*state.vminPx}px 0")

  
  condCSS = (elm, prop, test, tVal, fVal = "")->
    elm.css prop, if test then tVal else fVal
  
  
  renderItem = (item, state)->
    opacity = fixFloatError 1 - item.absScreenX / (state.tileSizePx * 2)
    condCSS item.elm, "transition", state.isTransitioning, "opacity .4s cubic-bezier(.2,.2,.3,.9)"
    condCSS item.elm, "display",   opacity >= 0, "block", "none"
    condCSS item.elm, "opacity",   opacity >= 0, opacity
    condCSS item.elm, "transform", opacity >= 0, "translateX(#{item.x}px)"
  
  
  renderPanelData = (state)->
    if state.isPanelOpen
      state.row.addClass "showingPanel"
      panel = state.panel
      currentItemElm = state.currentItem.elm
      panel.find("[product-name]").html currentItemElm.attr "item-name"
      # render variations, etc etc
    else
      state.row.removeClass "showingPanel"
  
  
  renderSliderData = (state)->
    condCSS state.slider, "transition", state.isTransitioning, "transform .6s cubic-bezier(.2,.2,.3,.9)"
    state.slider.css "transform", "translate(#{state.offsetX}px, #{state.offsetY}px)"
  
    
  renderInputData = (state)->
    state.e.preventDefault() if state.isSliding
  
    
  render = (state)->
    renderItem item, state for item in state.itemList
    renderPanelData state
    renderSliderData state
    renderInputData state
    return !state.isSliding
  
  
  # INITIALIZE ####################################################################################
  
  
  for rowElm in $("totem-row")
    row = $ rowElm
    inputLayer = row.find "input-layer"
    
    state =
      blockClickTime: 0
      clipper: row.find "clipping-layer"
      currentItem: null
      e: null
      isPanelOpen: false
      isScrolling: false
      isSliding: false
      isTransitioning: true
      itemList: for item, i in row.find "totem-item"
        absScreenX: 0
        elm: $ item
        imageElm: $(item).find("totem-image")
        i: i
        octave: 0
        screenX: 0
        x: 0
        ypos: item.getAttribute "item-ypos"
      offsetX: 0
      offsetXStart: 0
      offsetY: 0
      offsetUnits: 0
      panel: row.find "totem-panel"
      row: row
      slider: row.find "sliding-layer"
      sliderWidthPx: 0
      tileSizePx: 0
      touchCurrent:  x:0, y:0
      touchPrevious: x:0, y:0
      touchStart:    x:0, y:0
      vminPx: 0
    
    render resize state
    $(window).resize ()-> render resize state
    # inputLayer.click (e)-> render click state, e.clientX
    inputLayer.on "touchstart", (e)-> render touchstart state, e
    inputLayer.on "touchmove", (e)-> render touchmove state, e
    inputLayer.on "touchend", (e)-> render touchend state, e
    
