angular.module "StockQuantity", []

.directive "stockQuantity", new Array "$http", "$timeout", ($http, $timeout)->
  link: (scope, elm, attrs)->
    
    # ELEMENTS
    
    input = elm.children(".quantity")
    button = elm.children(".save")
    
    
    # HELPERS
    
    showButton = (show = true)->
      button.css("visibility", if show then "visible" else "hidden")
    
    setSaving = (saving = true)->
      if saving
        button.addClass("saving")
      else
        button.removeClass("saving")
    
    save = ()->
      $http.put attrs.path, {quantity: input.prop("value")}
      .success (data, status, headers, config)->
        setSaving(false)
        showButton(false)
      .error (data, status, headers, config)->
        alert "Save failed.. stinks!"
        setSaving(false)

    
    # EVENT HANDLERS
    
    input.on "change", ()->
      showButton()
    
    button.on "click", ()->
      setSaving()
      $timeout(save, 1000)
    

    # SETUP
    
    showButton(false)
