Take "DOMContentLoaded", ()->
  
  PANEL_OPEN_CENTER_POS = 30 # panelClosedCenterPos would be 50
  TILE_SIZE = 82
  
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
  
    
  # STRUCT GENERATION FUNCTIONS ####################################################################
  
  newPanelData = (panel)->
    return panelData =
      panel: panel
      panelOpen: false
  
  newItemData = (totemItem, i)->
    return itemData =
      item: $ totemItem
      i: i
      x:0
      screenX:0
      absScreenX:0
      octave:0
      ypos: totemItem.getAttribute("item-ypos")
  
  newItemDataList = (totemItems)->
    return itemDataList =
      for totemItem, i in totemItems
        newItemData totemItem, i
  
  newSliderData = (slider)->
    return sliderData =
      slider: slider
      offsetUnits: 0
      offsetPx: 0
      offsetPy: 0
      widthPx: 0
  
  newInputData = ()->
    return inputData =
      e: null
      blockNextClick: false
      sliding: false
      scrolling: false
      touching: false
      touchCurrent: x: 0, y:0
      touchStart: x: 0, y:0
  
  newRowState = (row, slider, totemItems, panel)->
    return rowState =
      row: row
      vminPx: 0
      tileSizePx: 0
      transitioning: true
      currentItemData: null
      inputData: newInputData()
      panelData: newPanelData panel
      sliderData: newSliderData slider
      itemDataList: newItemDataList totemItems

  
  # PURE LOGIC FUNCTIONS ##########################################################################
  
  currentItemDataGetter = (itemDataList)-> ()->
    closestDistance = Infinity
    closestItemData = null
    for itemData, i in itemDataList
      if itemData.absScreenX < closestDistance
        closestDistance = itemData.absScreenX
        closestItemData = itemData
    return closestItemData
  
  getVminPx = (win)->
    Math.min(win.innerWidth, win.innerHeight) / 100
  
  getUpdatedItemData = (sliderData, itemData, tileSizePx)->
    x = itemData.i * tileSizePx + itemData.octave * sliderData.widthPx
    screenX = fixFloatError x + sliderData.offsetPx
    absScreenX = Math.abs screenX
    return merge itemData, { x:x, screenX:screenX, absScreenX:absScreenX }
  
  wrapItemDataToScreen = (sliderData, itemData, tileSizePx)->
    if itemData.absScreenX > sliderData.widthPx/2
      itemData.octave -= itemData.screenX / itemData.absScreenX
      getUpdatedItemData sliderData, itemData, tileSizePx
    else
      itemData
  
  itemDataListUpdater = (sliderData, tileSizePx)-> (itemDataList)->
    for itemData in itemDataList
      itemData = getUpdatedItemData sliderData, itemData, tileSizePx
      itemData = wrapItemDataToScreen sliderData, itemData, tileSizePx
      itemData
  
  sliderOffsetPyUpdater = (rowState)-> ()->
    if rowState.panelData.panelOpen
      deltaPos = rowState.currentItemData.ypos - PANEL_OPEN_CENTER_POS
      deltaPx = rowState.tileSizePx * deltaPos/100
      return -deltaPx
    else
      return 0
  
  sliderOffsetPxUpdater = (rowState)-> ()->
    return rowState.sliderData.offsetUnits * rowState.tileSizePx
  
  touchingSliderOffsetPxUpdater = (inputData)-> (offsetPx)->
    if inputData.sliding
      return inputData.touchCurrent.x - inputData.touchStart.x
    else
      return 0
  
  slidingUpdater = (inputData)-> (sliding)->
    return true if sliding
    return false if inputData.scrolling
    xDelta = Math.abs inputData.touchCurrent.x - inputData.touchStart.x
    yDelta = Math.abs inputData.touchCurrent.y - inputData.touchStart.y
    return xDelta > 3 and xDelta > yDelta
    
  scrollingUpdater = (inputData)-> (scrolling)->
    return true if scrolling
    return false if inputData.sliding
    xDelta = Math.abs inputData.touchCurrent.x - inputData.touchStart.x
    yDelta = Math.abs inputData.touchCurrent.y - inputData.touchStart.y
    return yDelta > 3 and yDelta > xDelta
    
  updateSliderOffset = (rowState)->
    rowState = updateIn rowState, "sliderData", "offsetPx", sliderOffsetPxUpdater rowState
    rowState = updateIn rowState, "itemDataList", itemDataListUpdater rowState.sliderData, rowState.tileSizePx
    rowState = updateIn rowState, "currentItemData", currentItemDataGetter rowState.itemDataList
    return updateIn rowState, "sliderData", "offsetPy", sliderOffsetPyUpdater rowState

  slideBy = (rowState, delta)->
    return updateSliderOffset updateIn rowState, "sliderData", "offsetUnits", (offsetUnits)-> offsetUnits - delta
    
  togglePanelOpen = (rowState)->
    return updateSliderOffset updateIn rowState, "panelData", "panelOpen", (panelOpen)-> !panelOpen
  
  
  # PURE INPUT HANDLERS ###########################################################################
  
  resize = (win, rowState)->
    vminPx = getVminPx win
    tileSizePx = TILE_SIZE * vminPx
    sliderData = merge rowState.sliderData, { widthPx: rowState.itemDataList.length * tileSizePx }
    rowState = updateSliderOffset merge rowState, { vminPx:vminPx, tileSizePx:tileSizePx, sliderData:sliderData }
    rowState = updateIn rowState, "transitioning", ()-> false
    return rowState
  
  click = (win, rowState, clientX)->
    console.log "CLICK"
    if rowState.inputData.blockNextClick
      rowState = updateIn rowState, "inputData", "blockNextClick", ()-> false
      return rowState
    else
      clickVmin = (clientX - win.innerWidth/2) / rowState.vminPx
      absClickVmin = Math.abs clickVmin
      rowState = if absClickVmin < TILE_SIZE/2 # Half tile size
        togglePanelOpen rowState
      else
        slideBy rowState, clickVmin / absClickVmin
      rowState = updateIn rowState, "transitioning", ()-> true
      return rowState
  
  touchstart = (rowState, e)->
    touchPoint = e.originalEvent.touches[0]
    rowState = updateIn rowState, "inputData", "touching", ()-> true
    rowState = updateIn rowState, "inputData", "sliding", ()-> false
    rowState = updateIn rowState, "inputData", "scrolling", ()-> false
    rowState = updateIn rowState, "inputData", "touchStart", "x", ()-> touchPoint.screenX - rowState.sliderData.offsetPx
    rowState = updateIn rowState, "inputData", "touchStart", "y", ()-> touchPoint.screenY
    return rowState
  
  touchmove = (rowState, e)->
    touchPoint = e.originalEvent.touches[0]
    rowState = updateIn rowState, "inputData", "e", ()-> e
    rowState = updateIn rowState, "inputData", "touchCurrent", "x", ()-> touchPoint.screenX
    rowState = updateIn rowState, "inputData", "touchCurrent", "y", ()-> touchPoint.screenY
    rowState = updateIn rowState, "inputData", "sliding", slidingUpdater rowState.inputData
    rowState = updateIn rowState, "inputData", "scrolling", scrollingUpdater rowState.inputData
    rowState = updateIn rowState, "sliderData", "offsetPx", touchingSliderOffsetPxUpdater rowState.inputData
    rowState = updateIn rowState, "itemDataList", itemDataListUpdater rowState.sliderData, rowState.tileSizePx
    rowState = updateIn rowState, "currentItemData", currentItemDataGetter rowState.itemDataList
    rowState = updateIn rowState, "transitioning", ()-> !rowState.inputData.sliding
    return rowState
    
  touchend = (rowState)->
    console.log "END"
    rowState = updateIn rowState, "inputData", "touching", ()-> false
    rowState = updateIn rowState, "transitioning", ()-> true
    delta = Math.round (rowState.inputData.touchCurrent.x - rowState.inputData.touchStart.x) / rowState.tileSizePx
    delta = -delta + rowState.sliderData.offsetUnits
    rowState = slideBy rowState, delta
    rowState = updateIn rowState, "inputData", "blockNextClick", ()-> delta != 0
    return updateSliderOffset rowState
    
  
  
  # SIDE-EFFECTING HELPER FUNCTIONS ################################################################
  
  condCSS = (elm, prop, test, tVal, fVal = "")->
    elm.css prop, if test then tVal else fVal
  
  renderItemData = (itemData, rowState)->
    opacity = fixFloatError 1 - itemData.absScreenX / (rowState.tileSizePx * 2)
    condCSS itemData.item, "transition", rowState.transitioning, "opacity .4s cubic-bezier(.2,.2,.3,.9)"
    condCSS itemData.item, "display",   opacity >= 0, "block", "none"
    condCSS itemData.item, "opacity",   opacity >= 0, opacity
    condCSS itemData.item, "transform", opacity >= 0, "translateX(#{itemData.x}px)"
    return null
  
  renderPanelData = (rowState)->
    if rowState.panelData.panelOpen
      rowState.row.addClass "showingPanel"
      panel = rowState.panelData.panel
      currentItem = rowState.currentItemData.item
      panel.find("[product-name]").html currentItem.attr "item-name"
      # render variations, etc etc
    else
      rowState.row.removeClass "showingPanel"
    return null
  
  renderSliderData = (rowState)->
    condCSS rowState.sliderData.slider, "transition", rowState.transitioning, "transform .6s cubic-bezier(.2,.2,.3,.9)"
    rowState.sliderData.slider.css "transform", "translate(#{rowState.sliderData.offsetPx}px, #{rowState.sliderData.offsetPy}px)"
    return null
    
  renderInputData = (rowState)->
    rowState.inputData.e.preventDefault() if rowState.inputData.sliding
    return null
    
  render = (rowState)->
    renderItemData itemData, rowState for itemData in rowState.itemDataList
    renderPanelData rowState
    renderSliderData rowState
    renderInputData rowState
    return rowState # pass-through
  
  
  # INITIALIZE ####################################################################################
  
  for rowElm in $("totem-row")
    
    # DOM
    row = $ rowElm
    panel = row.find "totem-panel"
    slider = row.find "sliding-layer"
    inputLayer = row.find "input-layer"
    totemItems = slider.find "totem-item"
    
    # State
    rowState = render resize window, newRowState row, slider, totemItems, panel
    
    # Events
    $(window).resize ()-> rowState = render resize window, rowState
    inputLayer.click (e)-> rowState = render click window, rowState, e.clientX
    inputLayer.on "touchstart", (e)-> rowState = render touchstart rowState, e
    inputLayer.on "touchmove", (e)-> rowState = render touchmove rowState, e
    inputLayer.on "touchend", (e)-> rowState = render touchend rowState
