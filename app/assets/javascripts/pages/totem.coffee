$ ()->
  
  PANEL_OPEN_CENTER_POS = 30 # panelClosedCenterPos would be 50
  TILE_SIZE = 82
  
  # STATE #########################################################################################
  
  newItem = (item, i)->
    return item =
      elm: $ item
      i: i
      x:0
      screenX:0
      absScreenX:0
      octave:0
      ypos: item.getAttribute("item-ypos")
  
  newState = (row, slider, items, panel)->
    return state =
      blockClickTime: 0
      currentItem: null
      e: null
      itemList: (newItem item, i for item, i in items)
      offsetPx: 0
      offsetPy: 0
      offsetUnits: 0
      panel: panel
      panelOpen: false
      row: row
      scrolling: false
      slider: slider
      sliding: false
      tileSizePx: 0
      touchCurrent: x:0, y:0
      touchStart: x:0, y:0
      transitioning: true
      vminPx: 0
      widthPx: 0

  
  # PURE LIB FUNCTIONS #############################################################################
  
  # Takes 0 or more structs. Returns a new struct with the values from the given structs merged together.
  # Last struct wins. Shallow. Values copied by reference.
  merge = (structs...)->
    result = {}
    for struct in structs
      for k,v of struct
        result[k] = v
    result
  
  updateIn = (struct, keys..., fn)->
    key = keys.shift() # mutation
    val = struct[key]
    result = {}
    if keys.length > 0
      result[key] = updateIn val, keys..., fn
    else
      result[key] = fn val
    return merge struct, result
  
  fixFloatError = (i)->
    Math.round(i*1000)/1000
  
    
  # LOGIC FUNCTIONS ###############################################################################
  
  updateCurrentItem = (state)->
    closestDistance = Infinity
    for item, i in state.itemList
      if item.absScreenX < closestDistance
        closestDistance = item.absScreenX
        state.currentItem = item
  
  updateItem = (state, item)->
    item.x = item.i * state.tileSizePx + item.octave * state.widthPx
    item.screenX = fixFloatError item.x + state.offsetPx
    item.absScreenX = Math.abs item.screenX
  
  wrapItemToScreen = (state, item)->
    if item.absScreenX > state.widthPx/2
      item.octave -= item.screenX / item.absScreenX
      updateItem state, item
  
  updateItemList = (state)->
    for item in state.itemList
      updateItem state, item
      wrapItemToScreen state, item
  
  sliderOffsetPyUpdater = (state)-> ()->
    if state.panelOpen
      deltaPos = state.currentItem.ypos - PANEL_OPEN_CENTER_POS
      deltaPx = state.tileSizePx * deltaPos/100
      return -deltaPx
    else
      return 0
  
  sliderOffsetPxUpdater = (state)-> ()->
    return state.offsetUnits * state.tileSizePx
  
  updateSliderOffset = (state)->
    state = updateIn state, "offsetPx", sliderOffsetPxUpdater state
    updateItemList state
    updateCurrentItem state
    return updateIn state, "offsetPy", sliderOffsetPyUpdater state
  
  slideByUnits = (state, deltaUnits)->
    return updateSliderOffset updateIn state, "offsetUnits", (offsetUnits)-> offsetUnits - deltaUnits
    
  togglePanelOpen = (state)->
    return updateSliderOffset updateIn state, "panelOpen", (panelOpen)-> !panelOpen
  
  
  # PURE INPUT HANDLERS ###########################################################################
  
  resize = (win, state)->
    state.vminPx = Math.min(win.innerWidth, win.innerHeight) / 100
    state.tileSizePx = TILE_SIZE * state.vminPx
    state.widthPx = state.itemList.length * state.tileSizePx
    state = updateSliderOffset state
    state.transitioning = false
    return state
  
  click = (win, state, clientX)->
    if state.blockClickTime < Date.now() - 310
      clickVmin = (clientX - win.innerWidth/2) / state.vminPx
      absClickVmin = Math.abs clickVmin
      state = if absClickVmin < TILE_SIZE/2 # Half tile size
        togglePanelOpen state
      else
        slideByUnits state, clickVmin / absClickVmin
      state.transitioning = true
    return state
  
  touchstart = (state, e)->
    touchPoint = e.originalEvent.touches[0]
    state.sliding = false
    state.scrolling = false
    state.touchStart.x = touchPoint.screenX - state.offsetPx
    state.touchStart.y = touchPoint.screenY
    return state
  
  touchmove = (state, e)->
    state.e = e
    touchPoint = e.originalEvent.touches[0]
    state.touchCurrent.x = touchPoint.screenX
    state.touchCurrent.y = touchPoint.screenY
    unless state.sliding or state.scrolling
      xDelta = Math.abs state.touchCurrent.x - state.touchStart.x
      yDelta = Math.abs state.touchCurrent.y - state.touchStart.y
      state.sliding =   xDelta > 10 and xDelta >= yDelta
      state.scrolling = yDelta > 10 and yDelta < xDelta
    if state.sliding
      state.offsetPx = state.touchCurrent.x - state.touchStart.x
      updateItemList state
      updateCurrentItem state
      state.transitioning = !state.sliding
    return state
    
  touchend = (state)->
    state.transitioning = true
    deltaUnits = Math.round (state.touchCurrent.x - state.touchStart.x) / state.tileSizePx
    deltaUnits = -deltaUnits + state.offsetUnits
    state = slideByUnits state, deltaUnits
    # Manually toggle open the panel here, if we didn't slide/scroll
    state.blockClickTime = Date.now()
    return updateSliderOffset state
    
  
  
  # SIDE-EFFECTING HELPER FUNCTIONS ################################################################
  
  condCSS = (elm, prop, test, tVal, fVal = "")->
    elm.css prop, if test then tVal else fVal
  
  renderItem = (item, state)->
    opacity = fixFloatError 1 - item.absScreenX / (state.tileSizePx * 2)
    condCSS item.elm, "transition", state.transitioning, "opacity .4s cubic-bezier(.2,.2,.3,.9)"
    condCSS item.elm, "display",   opacity >= 0, "block", "none"
    condCSS item.elm, "opacity",   opacity >= 0, opacity
    condCSS item.elm, "transform", opacity >= 0, "translateX(#{item.x}px)"
    return null
  
  renderPanelData = (state)->
    if state.panelOpen
      state.row.addClass "showingPanel"
      panel = state.panel
      currentItemElm = state.currentItem.elm
      panel.find("[product-name]").html currentItemElm.attr "item-name"
      # render variations, etc etc
    else
      state.row.removeClass "showingPanel"
    return null
  
  renderSliderData = (state)->
    condCSS state.slider, "transition", state.transitioning, "transform .6s cubic-bezier(.2,.2,.3,.9)"
    state.slider.css "transform", "translate(#{state.offsetPx}px, #{state.offsetPy}px)"
    return null
    
  renderInputData = (state)->
    state.e.preventDefault() if state.sliding
    return null
    
  render = (state)->
    renderItem item, state for item in state.itemList
    renderPanelData state
    renderSliderData state
    renderInputData state
    return state # pass-through
  
  
  # INITIALIZE ####################################################################################
  
  for rowElm in $("totem-row")
    row = $ rowElm
    panel = row.find "totem-panel"
    slider = row.find "sliding-layer"
    items = row.find "totem-item"
    inputLayer = row.find "input-layer"
    
    state = render resize window, newState row, slider, items, panel
    
    $(window).resize ()-> state = render resize window, state
    inputLayer.click (e)-> state = render click window, state, e.clientX
    inputLayer.on "touchstart", (e)-> state = render touchstart state, e
    inputLayer.on "touchmove", (e)-> state = render touchmove state, e
    inputLayer.on "touchend", (e)-> state = render touchend state
    
