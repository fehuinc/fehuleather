angular.module 'reverse', []

.filter 'reverse', ()->
  (items, active = true)->
    if active then items.slice().reverse() else items
