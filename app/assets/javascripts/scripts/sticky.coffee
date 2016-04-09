# DISABLED UNTIL WE BOTHER TO FIX THEE BUGS

# Take ["FeatureDetect", "load"], (FeatureDetect)->
#
#   disableStickyFallback = (elm, placeholder)->
#     elm.css "position", "static"
#     elm.css "top", ""
#     elm.css "left", ""
#     placeholder.remove()
#
#   setup = (elm)->
#     top = parseInt elm.attr("sticky"), 10
#
#     unless FeatureDetect("position", "sticky")
#       originalPosition = elm[0].getBoundingClientRect()
#       placeholder = $ "<sticky-placeholder></sticky-placeholder>"
#       placeholder.css "display", window.getComputedStyle(elm[0]).display
#       placeholder.css "width", originalPosition.width + "px"
#       placeholder.css "height", originalPosition.height + "px"
#       isAdded = false
#
#       update = ()->
#         shouldBeAdded = window.pageYOffset + top >= originalPosition.top
#         if shouldBeAdded and not isAdded
#           isAdded = true
#           elm.css "position", "fixed"
#           elm.css "top", "#{top}px"
#           elm.css "left", (originalPosition.left - window.pageXOffset) + "px"
#           elm.before placeholder
#         else if isAdded and not shouldBeAdded
#           isAdded = false
#           disableStickyFallback elm, placeholder
#
#       window.addEventListener "resize", ()->
#         disableStickyFallback elm, placeholder
#
#
#       window.addEventListener "scroll", update
#       update()
#
#
#   # INIT ##########################################################################################
#
#   for elm in $ "[sticky]"
#     setup $ elm
