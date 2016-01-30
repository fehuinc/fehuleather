angular.module "Deleter", []

.directive "deleter", new Array "$http", "$timeout", ($http, $timeout)->
  link: (scope, elm, attrs)->
    
    # LOCALS
    isDown = false
    to = null
    
    # HELPERS
    
    kill = ()->
      elm.css "visibility", "hidden"
      $http.delete attrs.path
      .success (data, status, headers, config)->
        window.location = attrs.redirect
      .error (data, status, headers, config)->
        alert "Delete failed.. sorry hoo!"
        elm.css "visibility", "visible"
    
    down = (e)->
      if not isDown and e.button is 0
        isDown = true
        elm[0].classList.add("deleting")
        to = $timeout(2000)
        to.then kill # Do not combine with previous line, or $timeout.cancel won't work
    
    up = ()->
      if isDown
        isDown = false
        elm[0].classList.remove("deleting")
        $timeout.cancel(to)
    
    # EVENT HANDLING
    elm.on "mousedown touchstart", down
    angular.element(window).on "mouseup touchend", up
