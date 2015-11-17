angular.module 'reverse', []

.filter 'reverse', ()->
  (items, active = true)->
    console.log "THIS IS USED" # I don't think this is used, so log if it is
    if active then items.slice().reverse() else items
