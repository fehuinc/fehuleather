angular.module "WideOrTall", []

.directive "wideOrTall", ()->
  link: (scope, elm, attrs)->
    update = ()->
      if window.innerWidth > window.innerHeight
        elm.addClass "wide"
           .removeClass "tall"
      else
        elm.removeClass "wide"
           .addClass "tall"
    
    elm.on "resize", update
    update()
