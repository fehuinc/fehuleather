angular.module 'Storage', []

.service 'LocalStorage', new Array "$window", "StorageMaker", ($window, StorageMaker)->
  try
    return StorageMaker $window.localStorage
  catch error
    console.log "Storage: window.localStorage unavailable"
    console.log error
    return StorageMaker {}

.service 'StorageMaker', ()->
  _encode = (v)->
    return angular.toJson { value: v }
  
  _decode = (v)->
    return angular.fromJson(v).value if v?
  
  return StorageMaker = (storage)->
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
