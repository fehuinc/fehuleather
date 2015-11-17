angular.module "Sticky", []

.directive "sticky", new Array "FeatureDetect", (FeatureDetect)->
  link: (scope, aelm, attrs)->
    
    elm = aelm[0]
    top = parseInt(attrs.sticky)
    
    if FeatureDetect("position", "sticky")
      # console.log "NATIVE"
      elm.classList.add("sticky")
      elm.style.top = top + "px"
    
    # Fallback
    else
      # console.log "FALLBACK"
      originalPosition = elm.getBoundingClientRect()
      placeholder = document.createElement("sticky-placeholder")
      placeholder.style.width = originalPosition.width + "px"
      placeholder.style.height = originalPosition.height + "px"
      isAdded = false
    
      window.addEventListener "scroll", ()->
        shouldBeAdded = window.pageYOffset + top >= originalPosition.top
        if shouldBeAdded and not isAdded
          isAdded = true
          elm.style.position = "fixed"
          elm.style.top = "#{top}px"
          elm.style.left = (originalPosition.left - window.pageXOffset) + "px"
          elm.parentNode.insertBefore(placeholder, elm)
        else if isAdded and not shouldBeAdded
          isAdded = false
          elm.style.position = "static"
          elm.style.top = elm.style.left = ""
          elm.parentNode.removeChild(placeholder)
