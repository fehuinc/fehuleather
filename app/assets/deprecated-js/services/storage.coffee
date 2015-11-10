# cdStorage
# Key/Value storage that persists on the local machine.
# Provides both localStorage and sessionStorage
# Both keys and values may be any data type
# Supports ONE WAY binding a scope model, with optional initial value and custom key
# Note: If loaded from a 3rd party (like S3), and you have 3rd party data access turned off, it will error

angular.module 'cdStorage', []



.service 'LocalStorage', [
  "$window"
  "cdStorageMaker"
  ($window, cdStorageMaker)->
    try
      return cdStorageMaker $window.localStorage
    catch error
      console.log "cdStorage: window.localStorage unavailable"
      console.log error
      return cdStorageMaker {}
]


.service 'SessionStorage', [
  "$window"
  "cdStorageMaker"
  ($window, cdStorageMaker)->
    try
      return cdStorageMaker $window.sessionStorage
    catch error
      console.log "cdStorage: window.sessionStorage unavailable"
      console.log error
      return cdStorageMaker {}
]


.service 'cdStorageMaker', [
  ()->
    _encode = (v)->
      return angular.toJson { value: v }
    
    _decode = (v)->
      return angular.fromJson(v).value if v?
    
    return cdStorageMaker = (storage)->
      return storageAPI =
        
        has: (key)->
          return storage[_encode key]?
        
        get: (key)->
          return _decode storage[_encode key]
          
        set: (key, value)->
          storage[_encode key] = _encode value
          return value # Pass through
          
        remove: (key)->
          delete storage[_encode key]
          
        clearAll: ()->
          delete storage[i] for i of storage
          
        bind: (scope, model, initial, custom = "")->
          # Note: This is a ONE WAY bind!!
          
          # The custom part of the key lets you use the same model name on different scopes without collision
          key = model + custom
          
          if storageAPI.has key
            scope[model] = storageAPI.get key
          else if not scope[model]?
            scope[model] = initial
            storageAPI.set key, initial
          
          update = (newVal)->
            storageAPI.set key, newVal
          scope.$watch model, update, true
]
