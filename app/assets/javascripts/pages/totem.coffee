angular.module "Totem", []

.controller "TotemCtrl", new Array "$scope", ($scope)->
  
  ## LOCALS
  
  showingProduct =
    index: null
    scope: null
  
  
  $scope.shopInfos = [
    {name: "Payment", content: "You can pay with your own blood!"}
    {name: "Shipping", content: "We don't actually use ships."}
    {name: "Returns", content: "The return statement lets you get data back out of a function."}
    {name: "Questions", content: "Answers"}
  ]
  
  
  
  ## HELPERS
  
  generateTotemImagePath = (variant, product)->
    file = "#{product.name}/totem/"
    file += [variant.name].concat(product.namesOfDefaultVariantsWithImages).join("-")
    file = file.toLowerCase()
        .replace('&', 'and')
        .replace(/[^0-9a-z\-\/]/g, ' ')
        .replace(/\s+/g, '-')
    file = "#{FEHU.imagePath}#{file}.jpg"

  
  
  ## SCOPE FUNCTIONS
  
  $scope.infoIsOpen = (productIndex)->
    return showingProduct.index is productIndex
  
  $scope.toggleProductInfo = (productIndex, productScope)->
    showingProduct.scope?.showingProductInfo = false
    
    if showingProduct.index is productIndex
      showingProduct.index = null
      showingProduct.scope = null
    else
      showingProduct.index = productIndex
      showingProduct.scope = productScope
      showingProduct.scope?.showingProductInfo = true
  
  
  
  ## INITIALIZATION
  
  $scope.products = FEHU.totemProducts
  
  for product in $scope.products
    console.log product
    
    product.variations = product.variations.sort "level" # Not sure if this is necessary
    
    # We want the default variant of all variations that have an image
    product.namesOfDefaultVariantsWithImages = []
    
    # We're going to loop through all variations and do some setup
    for variation, i in product.variations
      defaultVariant = null
      defaultVariantIndex = null
      
      for variant, vi in variation.variants when variant.default
        defaultVariant = variant
        defaultVariantIndex = vi
      
      # If there's no default, we'll just use the first result
      unless defaultVariant?
        defaultVariant = variation.variants[0]
        defaultVariantIndex = 0
      
      variation.choice = defaultVariant
      variation.choiceIndex = defaultVariantIndex
      
      # Skip the first variation, because we're already using it for the totem
      if i > 0 and variation.has_image
        product.namesOfDefaultVariantsWithImages.push defaultVariant.name
    
    # Now, generate specimens
    product.specimens = for variant in product.variations[0].variants
      name: variant.name
      totem: generateTotemImagePath variant, product
      description: variant.description









.directive "product", ()->
  controller: new Array "$scope", ($scope)->
    
    ## LOCALS
    productIndex = $scope.$index
    
    
    ## HELPERS
    getSpecimenIndex = (rawIndex)->
      specimens = $scope.product.specimens
      return (rawIndex + specimens.length) % specimens.length
    
    getSpecimen = (specimenIndex)->
      return $scope.product.specimens[specimenIndex]
    
    
    ## SCOPE
    $scope.specimensCount = ()->
      return $scope.product.specimens.length
    
    $scope.getTotemImage = (rawIndex)->
      return getSpecimen(getSpecimenIndex(rawIndex))?.totem
    
    $scope.getVerticalPositionStyle = ()->
      ypos = if $scope.infoIsOpen(productIndex) then $scope.product.ypos else 0
      translate = "translate(-50%, -#{ypos}%)"
      return style =
        transform: translate
        "-webkit-transform": translate
    
    $scope.changeSpecimen = (rawIndex)->
      specimenIndex = getSpecimenIndex(rawIndex)
      $scope.specimen = getSpecimen(specimenIndex)
      variation = $scope.product.variations[0]
      variation.choiceIndex = specimenIndex
      variation.choice = variation.variants[specimenIndex]
    
    $scope.checkChange = (variationIndex)->
      if variationIndex is 0
        $scope.requestSpecimen($scope.product.variations[0].choiceIndex)
      else
        variation = $scope.product.variations[variationIndex]
        variation.choice = variation.variants[variation.choiceIndex]
    
    $scope.choicePrice = ()->
      price = $scope.product.cents_retail
      
      for variation in $scope.product.variations
        price += variation.choice.cents_retail
      
      return $scope.product.quantity * price / 100
    
    
    # SETUP
    
    # We need to do this, or the description doesn't show
    $scope.changeSpecimen(0)









.directive "productInfo", new Array "Cart", "$rootScope", "$timeout", (Cart, $rootScope, $timeout)->
  link: (scope)->
    scope.isInCart = Cart.has
    scope.getQuantity = Cart.quantity
    
    scope.addToCart = (product)->
      Cart.add(product)
    
    scope.showInfo = (info)->
      if info != scope.showingInfo
        scope.showingInfo = info
      else
        scope.showingInfo = null
    
    scope.showCart = ()->
      document.body.scrollTop = 0
      
      $timeout (()-> $rootScope.cartShowing = true), 200



.directive "specimens", new Array "$swipe", ($swipe)->
  controller: new Array "$scope", ($scope)->
    $scope.$parent.requestSpecimen = (index)->
      $scope.requestSpecimen(index)
  
  link: (scope, element)->
    
    ## CONFIG
    animationTime = 400
    animString = " #{animationTime}ms cubic-bezier(.16,.56,.5,1)" # Must begin with a space
    wrapping = true # Whether or not to infinitely wrap around at the left/right ends
    
    
    ## STATE
    dragStart = 0
    # The offset values describe how many images we've shifted left (-) or right (+)
    scope.offset = 0
    scope.offsetA = 0
    scope.offsetB = 0
    scope.offsetC = 0
    
    
    ## REFERENCES
    productIndex = scope.$index
    nSpecimens = scope.specimensCount()
    
    slider = element[0].querySelector "horizontal-slider"
    sliderNG = angular.element slider
    closer = angular.element element[0].querySelector ".closer"
    
    A = slider.querySelector ".A"
    B = slider.querySelector ".B"
    C = slider.querySelector ".C"
    
    
    ## HELPERS
    
    setSpecimen = (specimen, prop, value)->
      specimen.style["-webkit-"+prop] = value
      specimen.style["-ms-"+prop] = value
      specimen.style[prop] = value
    
    setSlider = (prop, value, addPrefixToValue = false)->
      slider.style["-webkit-"+prop] = (if addPrefixToValue then "-webkit-"+value else value)
      slider.style["-ms-"+prop] = (if addPrefixToValue then "-ms-"+value else value)
      slider.style[prop] = value
    
    clip = (v, min, max)->
      Math.min(Math.max(v, min), max)
    
    
    ## LOGIC
    
    adjustOffsets = (delta)->
      scope.offset += delta
      if not wrapping
        scope.offset = clip scope.offset, -nSpecimens+1, 0
      scope.offsetA = Math.floor((-scope.offset+2)/3)*3
      scope.offsetB = Math.floor((-scope.offset+1)/3)*3
      scope.offsetC = Math.floor((-scope.offset+0)/3)*3
      scope.changeSpecimen -scope.offset
    
    enableTransition = (enable = true)->
      setSlider "transition", (if enable then "transform" + animString else null), true
      A.style.transition = (if enable then "opacity" + animString else null)
      B.style.transition = (if enable then "opacity" + animString else null)
      C.style.transition = (if enable then "opacity" + animString else null)
    
    applyTranslate = (x)->
      x += scope.offset * A.offsetWidth
      setSlider "transform", "translateX(#{x}px)"
      setSpecimen A, "transform", "translateX(#{scope.offsetA * A.offsetWidth}px)"
      setSpecimen B, "transform", "translateX(#{scope.offsetB * A.offsetWidth}px)"
      setSpecimen C, "transform", "translateX(#{scope.offsetC * A.offsetWidth}px)"
    
    applyOpacity = (v)->
      v += scope.offset
      A.style.opacity = 1 - Math.abs (v + scope.offsetA - 1) / 1.25
      B.style.opacity = 1 - Math.abs (v + scope.offsetB)     / 1.25
      C.style.opacity = 1 - Math.abs (v + scope.offsetC + 1) / 1.25
    
    setSliderPosition = (x)->
      applyTranslate x
      applyOpacity x / A.offsetWidth
    
    resetSliderPosition = ()->
      setSliderPosition(0)
    
    
    ## SWIPE HANDLERS
    
    handlers =
      start: (pos, event)->
        dragStart = pos.x
        enableTransition false
        
      move: (pos)->
        x = pos.x - dragStart
        setSliderPosition x
        
      end: (pos)->
        x = pos.x - dragStart
        enableTransition true
        if x >  A.offsetWidth / 5 then adjustOffsets 1
        if x < -A.offsetWidth / 5 then adjustOffsets -1
        scope.$apply ()-> resetSliderPosition()
    
    
    ## SCOPE FUNCTIONS
    
    scope.requestSpecimen = (index)->
      enableTransition()
      scope.offset = -index
      adjustOffsets 0
      resetSliderPosition()
    
    scope.clickAction = (shift)->
      if shift > 0
        enableTransition()
        adjustOffsets -1
        resetSliderPosition()
      else if shift < 0
        enableTransition()
        adjustOffsets 1
        resetSliderPosition()
      else
        scope.toggleProductInfo(productIndex, scope)
    
    scope.getClass = (shift)->
      if shift > 0
        "next"
      else if shift < 0
        "prev"
      else
        "current"
    
    
    ## EVENT LISTENING
    
    $swipe.bind sliderNG, handlers, ["touch"]
    
    window.addEventListener "resize", (e)->
      # This might be problematic if they are swiping while the resize occurs
      resetSliderPosition()
    
    scope.close = ()->
      scope.toggleProductInfo(productIndex, scope)
