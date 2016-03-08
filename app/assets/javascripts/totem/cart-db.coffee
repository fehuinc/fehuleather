$ ()->
  state = {}
  
  Make "CartDB", CartDB =
    hasItem: (buildID)->
      state[buildID]?
      
    addItem: (buildID)->
      state[buildID] ?= 1
