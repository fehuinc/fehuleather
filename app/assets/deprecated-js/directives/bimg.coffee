# bimg
# Dynamic css background images!
#
# Can be used as an element or an attribute.
# If you're using it as an element, make sure to set a width/height/display.
#
# Suggested CSS:
# [bimg] {
# 	background-size: contain;
# 	background-repeat: no-repeat;
# 	background-position: center center;
# }

angular.module "bimg", []

.directive "bimg", ()->
  link: (scope, elm, attrs)->
    attrs.$observe "bimg", ()->
      if attrs.bimg? and attrs.bimg.length > 0
        elm.css({"background-image": "url(#{attrs.bimg})"})
