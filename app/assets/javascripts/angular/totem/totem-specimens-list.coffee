# STATE SHARED BY ALL SPECIMENS WITHIN ONE PRODUCT

angular.module "TotemSpecimensList", []

.directive "totemSpecimensList", new Array "$swipe", ($swipe)->
  controller: new Array "$scope", ($scope)->

    $scope.getListPositionStyle = ()->
      ypos = if $scope.isPanelOpen($scope.product) then $scope.product.ypos else 0
      translate = "translateY(-#{ypos}%)"
      return style =
        transform: translate
        "-webkit-transform": translate


#     $scope.$parent.requestSpecimen = (index)->
#       $scope.requestSpecimen(index)
#
#   link: (scope, element)->
#
#     ## CONFIG
#     animationTime = 400
#     animString = " #{animationTime}ms cubic-bezier(.16,.56,.5,1)" # Must begin with a space
#     wrapping = true # Whether or not to infinitely wrap around at the left/right ends
#
#
#     ## STATE
#     dragStart = 0
#     # The offset values describe how many images we've shifted left (-) or right (+)
#     scope.offset = 0
#     scope.offsetA = 0
#     scope.offsetB = 0
#     scope.offsetC = 0
#
#
#     ## REFERENCES
#     productIndex = scope.$index
#     nSpecimens = scope.specimensCount()
#
#     slider = element[0].querySelector "horizontal-slider"
#     sliderNG = angular.element slider
#     closer = angular.element element[0].querySelector ".closer"
#
#     A = slider.querySelector ".A"
#     B = slider.querySelector ".B"
#     C = slider.querySelector ".C"
#
#
#     ## HELPERS
#
#     setSpecimen = (specimen, prop, value)->
#       specimen.style["-webkit-"+prop] = value
#       specimen.style["-ms-"+prop] = value
#       specimen.style[prop] = value
#
#     setSlider = (prop, value, addPrefixToValue = false)->
#       slider.style["-webkit-"+prop] = (if addPrefixToValue then "-webkit-"+value else value)
#       slider.style["-ms-"+prop] = (if addPrefixToValue then "-ms-"+value else value)
#       slider.style[prop] = value
#
#     clip = (v, min, max)->
#       Math.min(Math.max(v, min), max)
#
#
#     ## LOGIC
#
#     adjustOffsets = (delta)->
#       scope.offset += delta
#       if not wrapping
#         scope.offset = clip scope.offset, -nSpecimens+1, 0
#       scope.offsetA = Math.floor((-scope.offset+2)/3)*3
#       scope.offsetB = Math.floor((-scope.offset+1)/3)*3
#       scope.offsetC = Math.floor((-scope.offset+0)/3)*3
#       scope.changeSpecimen -scope.offset
#
#     enableTransition = (enable = true)->
#       setSlider "transition", (if enable then "transform" + animString else null), true
#       A.style.transition = (if enable then "opacity" + animString else null)
#       B.style.transition = (if enable then "opacity" + animString else null)
#       C.style.transition = (if enable then "opacity" + animString else null)
#
#     applyTranslate = (x)->
#       x += scope.offset * A.offsetWidth
#       setSlider "transform", "translateX(#{x}px)"
#       setSpecimen A, "transform", "translateX(#{scope.offsetA * A.offsetWidth}px)"
#       setSpecimen B, "transform", "translateX(#{scope.offsetB * A.offsetWidth}px)"
#       setSpecimen C, "transform", "translateX(#{scope.offsetC * A.offsetWidth}px)"
#
#     applyOpacity = (v)->
#       v += scope.offset
#       A.style.opacity = 1 - Math.abs (v + scope.offsetA - 1) / 1.25
#       B.style.opacity = 1 - Math.abs (v + scope.offsetB)     / 1.25
#       C.style.opacity = 1 - Math.abs (v + scope.offsetC + 1) / 1.25
#
#     setSliderPosition = (x)->
#       applyTranslate x
#       applyOpacity x / A.offsetWidth
#
#     resetSliderPosition = ()->
#       setSliderPosition(0)
#
#
#     ## SWIPE HANDLERS
#
#     handlers =
#       start: (pos, event)->
#         dragStart = pos.x
#         enableTransition false
#
#       move: (pos)->
#         x = pos.x - dragStart
#         setSliderPosition x
#
#       end: (pos)->
#         x = pos.x - dragStart
#         enableTransition true
#         if x >  A.offsetWidth / 5 then adjustOffsets 1
#         if x < -A.offsetWidth / 5 then adjustOffsets -1
#         scope.$apply ()-> resetSliderPosition()
#
#
#     ## SCOPE FUNCTIONS
#
#     scope.requestSpecimen = (index)->
#       enableTransition()
#       scope.offset = -index
#       adjustOffsets 0
#       resetSliderPosition()
#
#     scope.clickAction = (shift)->
#       if shift > 0
#         enableTransition()
#         adjustOffsets -1
#         resetSliderPosition()
#       else if shift < 0
#         enableTransition()
#         adjustOffsets 1
#         resetSliderPosition()
#       else
#         scope.toggleProductInfo(productIndex, scope)
#
#     scope.getClass = (shift)->
#       if shift > 0
#         "next"
#       else if shift < 0
#         "prev"
#       else
#         "current"
#
#
#     ## EVENT LISTENING
#
#     $swipe.bind sliderNG, handlers, ["touch"]
#
#     window.addEventListener "resize", (e)->
#       # This might be problematic if they are swiping while the resize occurs
#       resetSliderPosition()
#