angular.module "FeatureDetect", []

.service "FeatureDetect", ()->
  cache = {}
  
  detect = (prop, value)->
    prop = prop + ':'
    detect = document.createElement("feature-detect")
    prefixes = ' -webkit- -moz- -o- -ms- '.split(' ')
    detect.style.cssText = prop + prefixes.join(value + ';' + prop).slice(0, -prop.length)
    return detect.style.position.indexOf(value) isnt -1
  
  (prop, value)->
    if value?
      return cache[prop + value] ?= detect(prop, value)
    else
      return cache[prop] ?= detect(prop)
