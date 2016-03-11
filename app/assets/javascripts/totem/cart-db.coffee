Take "LocalStorage", (LocalStorage)->
  state = null
  callbacks = []
  LSKey = "cart-db"
  
  # FUNCTIONS #####################################################################################
  
  
  newState = ()->
    buildCount: 0
    builds: {}
  
  recount = ()->
    state.buildCount = (k for k of state.builds).length
  
  runCallback = (cb)->
    cb state.builds, state.buildCount
    
  runCallbacks = ()->
    runCallback cb for cb in callbacks
  
  save = ()->
    LocalStorage.set LSKey, state
    
  
  # INIT ##########################################################################################
  
  
  state = LocalStorage.get(LSKey) or newState()
  
  
  # API ###########################################################################################
  
  
  Make "CartDB", CartDB =
    isEmpty: ()->
      return state.buildCount is 0
    
    hasBuild: (build)->
      return state.builds[build.id]?
      
    addBuild: (build)->
      b = state.builds[build.id] ?= build
      b.quantity ?= 1
      recount()
      save()
      runCallbacks()
    
    getCount: ()->
      return state.buildCount
    
    getBuilds: ()->
      return state.builds
    
    addCallback: (cb)->
      callbacks.push cb
      runCallback cb
    
    clear: ()->
      state = newState()
      save()
