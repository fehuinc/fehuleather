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
  
  recount = ()->
    state.buildCount = 0
    state.quantity = 0
    state.subtotal = 0
    for k, item of state.builds
      state.buildCount += 1
      state.quantity += parseInt item.quantity
      state.subtotal += item.retail_prices[state.currency] * item.quantity
  
  runCallback = (cb)->
    cb state.builds, state.buildCount
    
  runCallbacks = ()->
    runCallback cb for cb in callbacks
  
  save = ()->
    LocalStorage.set LSKey, state
    
  
  # INIT ##########################################################################################
  
  
  state = LocalStorage.get(LSKey) or newState()
  recount()
  
  
  # API ###########################################################################################
  
  
  Make "CartDB", CartDB =
    addCallback: (cb)->
      callbacks.push cb
      runCallback cb
    
    clear: ()->
      oldCurrency = state.currency
      state = newState()
      state.currency = oldCurrency
      recount()
      save()
      runCallbacks()

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
    
    hasBuild: (build)->
      return state.builds[build.id]?
    
    isEmpty: ()->
      return state.buildCount is 0
    
    setBuild: (build, quantity = 1)->
      b = state.builds[build.id] ?= build
      b.quantity = quantity
      recount()
      save()
      runCallbacks()

    toggleCurrency: ()->
      state.currency = if state.currency == "CAD" then "USD" else "CAD"
      recount()
      save()
      runCallbacks()
