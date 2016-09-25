Take "LocalStorage", (LocalStorage)->
  state = null
  callbacks = []
  LSKey = "cart-db"
  
  
  # FUNCTIONS #####################################################################################
  
  newState = ()->
    buildCount: 0
    builds: {}
    currency: "CAD"
    quantity: 0
    subtotal: 0
    tax: 0
  
  updateQuantity = (build, quantity)->
    b = state.builds[build.id] ?= build
    b.quantity = Math.max 0, Math.min build.stock, Math.round quantity
  
  trim = ()->
    for k, item of state.builds when item.quantity <= 0
      delete state.builds[k]
  
  recount = ()->
    state.buildCount = 0
    state.quantity = 0
    state.subtotal = 0
    for k, item of state.builds
      state.buildCount += 1
      state.quantity += parseInt item.quantity
      state.subtotal += item.retail_prices[state.currency] * item.quantity
    state.tax = if state.currency is "CAD"
      Math.round(state.subtotal * 5)/100
    else
      0
    state.subtotal += state.tax
  
  runCallback = (cb)->
    cb state.builds, state.buildCount
    
  runCallbacks = ()->
    runCallback cb for cb in callbacks
  
  save = ()->
    LocalStorage.set LSKey, state
  
  recountSaveRun = ()->
    recount()
    save()
    runCallbacks()
  
  
  # API ###########################################################################################
  
  Make "CartDB", CartDB =
    addCallback: (cb)->
      callbacks.push cb
      runCallback cb
    
    clear: ()->
      oldCurrency = state.currency
      state = newState()
      state.currency = oldCurrency
      recountSaveRun()

    getBuildById: (id)->
      return state.builds[id]
          
    getBuilds: ()->
      return state.builds

    getCount: ()->
      return state.buildCount
    
    getCurrency: ()->
      return state.currency
    
    getQuantity: ()->
      return state.quantity
    
    getSubtotal: ()->
      return state.subtotal
    
    getTax: ()->
      return state.tax
    
    hasBuild: (build)->
      return build? and state.builds[build.id]?
    
    isEmpty: ()->
      return state.buildCount is 0
    
    setBuild: (build, quantity)->
      updateQuantity build, quantity
      recountSaveRun()
    
    toggleCurrency: ()->
      state.currency = if state.currency == "CAD" then "USD" else "CAD"
      recountSaveRun()


  # INIT ##########################################################################################
  
  state = LocalStorage.get(LSKey) or newState()
  trim()
  recount()
  save()
