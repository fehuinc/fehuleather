Take [], ()->
  defaultPrefixes = ["webkit", "moz", "ms"]
  elm = document.createElement "feature-detect"
  resultCache = {}
  
  Make "FeatureDetect", (prop, value, prefixes = defaultPrefixes)->
    rule = "#{prop}:#{value};"
    for prefix in prefixes
      rule += "#{prop}:-#{prefix}-#{value};"
    elm.style.cssText = rule
    result = elm.style[prop].indexOf(value) isnt -1
    return resultCache[prop + value] ?= result
    
