$ ()->
  
  PANEL_OPEN_CENTER_POS = 30 # panelClosedCenterPos would be 50
  TILE_SIZE = 82
  
  currentPanelState = null
  
  
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
  
  
  wrapItemList = (state)->
    for item in state.itemList
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
    wrapItemList state
    updateCurrentItem state
  
  
  slideByUnits = (state, deltaUnits)->
    state.offsetUnits = state.offsetUnits - deltaUnits
    updateSliderOffset state
  
  
  togglePanel = (state, newVal)->
    state.isPanelOpen = if newVal? then newVal else !state.isPanelOpen
    
    if state.isPanelOpen
      render togglePanel(currentPanelState, false) if currentPanelState
      currentPanelState = state
      deltaPos = state.currentItem.ypos - PANEL_OPEN_CENTER_POS
      deltaPx = state.tileSizePx * deltaPos/100
      state.offsetY = -deltaPx
    else
      state.offsetY = 0
      currentPanelState = null
    return state # Used as an event, need to pass-through
  
  
  clickAction = (state, clientX)->
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
    state.isSliding = state.isScrolling = false
    clickAction state,(clientX) unless state.blockNextClick
    state.blockNextClick = false
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
    state.blockNextClick = true
    if state.isSliding
      state.offsetXPrevious = state.offsetX
      velPx = state.touchCurrent.x - state.touchPrevious.x
      totalDeltaUnits = (state.touchStart.x - state.touchCurrent.x) / state.tileSizePx
      
      if velPx > state.tileSizePx/50 and Math.round(totalDeltaUnits) >= 0
        slideByUnits state, -1
      else if velPx < -state.tileSizePx/50 and Math.round(totalDeltaUnits) <= 0
        slideByUnits state, 1
      else if velPx > 0 and totalDeltaUnits > 0.2
        slideByUnits state, -1
      else if velPx < 0 and totalDeltaUnits < 0.2
        slideByUnits state, 1
      else
        updateSliderOffset state
      state.isTransitioning = true
    else if not state.isScrolling
      clickAction state, state.touchStart.x
    return state

    
  # RENDERING #####################################################################################
  
  resizeRender = (state)->
    for item in state.itemList
      item.elm.css("margin-left", (window.innerWidth/2 - 40 * state.vminPx) + "px" )
      item.imageElm.width(80 * state.vminPx).height(80 * state.vminPx)
    state.slider.height(80 * state.vminPx)
    state.clipper.height(80 * state.vminPx)
    state.row.height(80 * state.vminPx).css("margin", "#{2*state.vminPx}px 0")
    rowPos = state.row.offset()
    rowPos.top += 60 * state.vminPx
    state.panel.css("top", rowPos.top)
  
  
  condCSS = (elm, prop, test, tVal, fVal = "")->
    elm.css prop, if test then tVal else fVal
  
  
  renderItem = (item, state)->
    pos = fixFloatError 1 - item.absScreenX / (state.tileSizePx * 2)
    # condCSS item.elm, "transition", state.isTransitioning, "opacity .4s cubic-bezier(.2,.2,.3,.9)"
    condCSS item.elm, "display",   pos >= 0, "block", "none"
    # condCSS item.elm, "opacity",   pos >= 0, pos
    condCSS item.elm, "opacity",   pos >= 0, if state.currentItem is item then 1 else 0.2
    condCSS item.elm, "transform", pos >= 0, "translateX(#{item.x}px)"
  
  
  renderPanelData = (state)->
    if state.isPanelOpen
      state.panel.addClass "showingPanel"
      panel = state.panel
      currentItemElm = state.currentItem.elm
      panel.find("[product-name]").html currentItemElm.attr "item-name"
      # render variations, etc etc
    else
      state.panel.removeClass "showingPanel"
  
  
  renderSliderData = (state)->
    time = 0.6
    x1 = y1 = .2
    x2 = .3
    y2 = .9
    if state.isTransitioning and state.isSliding
      dist = state.offsetX - state.offsetXPrevious
      vel = (state.touchCurrent.x - state.touchPrevious.x) * 60
      time = Math.abs dist/vel
      time = 10 * time
      time = Math.max .3, Math.min .8, time
      x1 = y1 = 0
      y1 = .3 + Math.max 0, (vel/dist)/50
    
    condCSS state.slider, "-webkit-transition", state.isTransitioning, "-webkit-transform #{time}s cubic-bezier(#{x1},#{y1},#{x2},#{y2})"
    condCSS state.slider, "-ms-transition", state.isTransitioning, "-ms-transform #{time}s cubic-bezier(#{x1},#{y1},#{x2},#{y2})"
    condCSS state.slider, "transition", state.isTransitioning, "transform #{time}s cubic-bezier(#{x1},#{y1},#{x2},#{y2})"
    state.slider.css "-webkit-transform", "translate(#{state.offsetX}px, #{state.offsetY}px)"
    state.slider.css "-ms-transform", "translate(#{state.offsetX}px, #{state.offsetY}px)"
    state.slider.css "transform", "translate(#{state.offsetX}px, #{state.offsetY}px)"
  
    
  render = (state)->
    renderItem item, state for item in state.itemList
    renderPanelData state
    renderSliderData state
    
    if state.isSliding
      state.e.preventDefault()
      return false
  
  
  # SETUP #########################################################################################
  
  
  setup = (rowElm)->
    row = $ rowElm
    inputLayer = row.find "input-layer"
    
    state =
      blockNextClick: false
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
      offsetXPrevious: 0
      offsetXStart: 0
      offsetY: 0
      offsetUnits: 0
      panel: row.next()
      row: row
      slider: row.find "sliding-layer"
      sliderWidthPx: 0
      tileSizePx: 0
      touchCurrent:  x:0, y:0
      touchPrevious: x:0, y:0
      touchStart:    x:0, y:0
      vminPx: 0
    
    $(window).resize ()-> render resize state
    inputLayer.click (e)-> render click state, e.clientX
    inputLayer.on "touchstart", (e)-> render touchstart state, e
    inputLayer.on "touchmove", (e)-> render touchmove state, e
    inputLayer.on "touchend", (e)-> render touchend state, e
    state.panel.find("panel-closer").click (e)-> render togglePanel state, false
    
    # Need to do this twice
    render resize state # Once now to avoid a flash
    setTimeout ()-> render resize state # Once later to make sure the panels go to the right spot
  
  
  # INIT ##########################################################################################
  setup rowElm for rowElm in $("totem-row")
