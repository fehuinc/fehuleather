angular.module "Deleter", []

.directive "deleter", new Array "$http", "$timeout", ($http, $timeout)->
  link: (scope, elm, attrs)->
    
    # LOCALS
    button = elm.find(".button")
    isDown = false
    to = null
    
    # HELPERS
    
    kill = ()->
      button.css "visibility", "hidden"
      $http.delete attrs.path
      .success (data, status, headers, config)->
        window.location = attrs.redirect
      .error (data, status, headers, config)->
        alert "Delete failed.. sorry hoo!"
        button.css "visibility", "visible"
    
    down = (e)->
      console.log e.button
      if not isDown and e.button is 0
        isDown = true
        button[0].classList.add("deleting")
        to = $timeout(2000)
        to.then kill # Do not combine with previous line, or $timeout.cancel won't work
    
    up = ()->
      if isDown
        isDown = false
        button[0].classList.remove("deleting")
        $timeout.cancel(to)
    
    # EVENT HANDLING
    button.on "mousedown touchstart", down
    angular.element(window).on "mouseup touchend", up
