$ ()->
  state = {}
  itemCount = 0
  callbacks = []
  persistedVersion = 0
  speculativeVersion = 0
  
  update = ()->
    itemCount = (k for k of state).length
    callback state, itemCount for callback in callbacks
  
  Make "CartDB", CartDB =
    hasItem: (buildID)->
      return state[buildID]?
      
    addItem: (buildID)->
      state[buildID] ?= 1
      update()
    
    addCallback: (cb)->
      callbacks.push cb
