angular.module "Deleter", []

.directive "deleter", new Array "$http", "$timeout", ($http, $timeout)->
  transclude: true
  template: '
    <ng-transclude class="button"></ng-transclude>
    '
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
    
    down = ()->
      if not isDown
        isDown = true
        to = $timeout(2000)
        to.then kill # Do not combine with previous line, or $timeout.cancel won't work
    
    up = ()->
      if isDown
        isDown = false
        $timeout.cancel(to)
    
    # EVENT HANDLING
    button.on "mousedown touchstart", down
    angular.element(window).on "mouseup touchend", up
