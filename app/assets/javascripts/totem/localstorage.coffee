Take [], ()->

  encode = (v)->
    return JSON.stringify v if v?
  
  decode = (v)->
    return JSON.parse v if v?
  
  
  Make "LocalStorage", LocalStorage =
    
    has: (key)->
      return window.localStorage[encode key]?
    
    get: (key)->
      return decode window.localStorage[encode key]
      
    set: (key, value)->
      window.localStorage[encode key] = encode value
      return value # Pass through
      
    remove: (key)->
      delete window.localStorage[encode key]
      
    clearAll: ()->
      delete window.localStorage[i] for i of storage
