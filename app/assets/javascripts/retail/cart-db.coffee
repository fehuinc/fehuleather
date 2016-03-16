Take "LocalStorage", (LocalStorage)->
  state = null
  callbacks = []
  LSKey = "cart-db"
  
  # FUNCTIONS #####################################################################################
  
  
  newState = ()->
    buildCount: 0
    builds: {}
    quantity: 0
    subtotalCents: 0
  
  recount = ()->
    state.buildCount = 0
    state.quantity = 0
    state.subtotalCents = 0
    for k, item of state.builds
      state.buildCount += 1
      state.quantity += parseInt item.quantity
      state.subtotalCents += item.price_retail * item.quantity
  
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
    isEmpty: ()->
      return state.buildCount is 0
    
    hasBuild: (build)->
      return state.builds[build.id]?
    
    setBuild: (build, quantity = 1)->
      b = state.builds[build.id] ?= build
      b.quantity = quantity
      recount()
      save()
      runCallbacks()
    
    getCount: ()->
      return state.buildCount
    
    getBuilds: ()->
      return state.builds
    
    getQuantity: ()->
      return state.quantity
    
    getSubtotalCents: ()->
      return state.subtotalCents
    
    getBuildById: (id)->
      return state.builds[id]
    
    addCallback: (cb)->
      callbacks.push cb
      runCallback cb
    
    clear: ()->
      state = newState()
      recount()
      save()
      runCallbacks()
