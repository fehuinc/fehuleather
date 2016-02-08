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
  
  newRowState = (row, slider, totemItems, panel)->
    return rowState =
      row: row
      vminPx: 0
      tileSizePx: 0
      currentItemData: null
      panelData: newPanelData panel
      sliderData: newSliderData slider
      itemDataList: newItemDataList totemItems

  
  # PURE LOGIC FUNCTIONS ##########################################################################
  
  getCurrentItemIndex = (itemDataList)->
    for item, i in itemDataList
      if item.absScreenX == 0
        return i
    throw "Could not determine currentItemIndex"
  
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
    rowState.sliderData.offsetUnits * rowState.tileSizePx
  
  
  update = (rowState)->
    rowState = updateIn rowState, "sliderData", "offsetPx", sliderOffsetPxUpdater rowState
    rowState = updateIn rowState, "itemDataList", itemDataListUpdater rowState.sliderData, rowState.tileSizePx
    rowState = updateIn rowState, "currentItemData", ()-> rowState.itemDataList[getCurrentItemIndex rowState.itemDataList]
    return updateIn rowState, "sliderData", "offsetPy", sliderOffsetPyUpdater rowState

  
  slideBy = (rowState, delta)->
    return update updateIn rowState, "sliderData", "offsetUnits", (offsetUnits)-> offsetUnits - delta
    
  togglePanelOpen = (rowState)->
    return update updateIn rowState, "panelData", "panelOpen", (panelOpen)-> !panelOpen
  
  resize = (win, rowState)->
    vminPx = getVminPx win
    tileSizePx = TILE_SIZE * vminPx
    sliderData = merge rowState.sliderData, { widthPx: rowState.itemDataList.length * tileSizePx }
    return update merge rowState, { vminPx:vminPx, tileSizePx:tileSizePx, sliderData:sliderData }
  
  
  click = (win, rowState, clientX)->
    clickVmin = (clientX - win.innerWidth/2) / rowState.vminPx
    absClickVmin = Math.abs clickVmin
    rowState = if absClickVmin < TILE_SIZE/2 # Half tile size
      togglePanelOpen rowState
    else
      slideBy rowState, clickVmin / absClickVmin
    return rowState
  
  
  # SIDE-EFFECTING HELPER FUNCTIONS ################################################################
  
  renderItemData = (itemData, tileSizePx)->
    opacity = fixFloatError 1 - itemData.absScreenX / (tileSizePx * 2)
    if opacity >= 0
      itemData.item.css "display", "block"
      itemData.item.css "opacity", opacity
      itemData.item.css "transform", "translateX(#{itemData.x}px)"
    else
      itemData.item.css "display", "none"
      itemData.item.css "opacity", ""
      itemData.item.css "transform", ""
    return null
  
  renderPanelData = (rowState)->
    if rowState.panelData.panelOpen
      rowState.row.addClass "showingPanel"

      panel = rowState.panelData.panel
      currentItem = rowState.currentItemData.item
      panel.find("[product-name]").html currentItem.attr "item-name"
    else
      rowState.row.removeClass "showingPanel"
    return null
      
  renderSliderData = (rowState)->
    rowState.sliderData.slider.css "transform", "translate(#{rowState.sliderData.offsetPx}px, #{rowState.sliderData.offsetPy}px)"
    return null
    
  render = (rowState)->
    renderItemData itemData, rowState.tileSizePx for itemData in rowState.itemDataList
    renderPanelData rowState
    renderSliderData rowState
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

# transform .6s cubic-bezier(.2,.2,.3,.9)
