$ ()->
  size = 90
  pad = 2
  openElm = null
  
  
  toggle = (elm)->
    elm
      .closest ".product"
      .find ".product-info"
      .toggleClass "showing"
  
  
  makeSpecimen = (type)->
    $ "<div/>", class: "#{type} specimen"
  
  getPosition = (elm)->
    parseInt elm.attr "specimen-position"
  
  setImage = (elm, imageUrl)->
    elm.css "background-image", "url('#{imageUrl}')"
  
  setTranslate = (elm, offset)->
    elm
      .css "transform", "translate(#{offset * (size + pad)}vmin)"
      .attr "specimen-position", offset
  
  getImage = (elm, productName)->
    currentPosition = getPosition elm
    images = FEHU.totemImages[productName]
    i = currentPosition % images.length
    i += images.length while i < 0
    imageUrl = images[i]

  shift = (slider, offset)->
    productName = slider.attr "product-name"
    slider.children()
      .each (_, _elm)->
        elm = $ elm
        prevOffset = getPosition elm
        setTranslate elm, prevOffset + offset
    
  generateSlidingSpecimens = (slider, productName)->
    for i in [-2..2]
      makeSpecimen "sliding"
        .appendTo slider
        .each (i, _elm)->
          elm = $ _elm
          setTranslate elm, i
          setImage elm, getImage elm, productName
        .click (e)->
          elm = $ e.target
          slider = elm.parent()
          offset = getPosition elm
          if offset is 0
            toggle elm
          else
            shift slider, offset
  
  generateSingleSpecimen = (slider, imageUrl)->
    specimen = makeSpecimen("single").appendTo(slider)
    setImage(specimen, imageUrl)

  
  $(".slider").each (_, _slider)->
    slider = $ _slider
    productName = slider.attr "product-name"
    images = FEHU.totemImages[productName]
    
    if images.length is 1
      generateSingleSpecimen slider, images[0]
    else
      generateSlidingSpecimens slider, productName
