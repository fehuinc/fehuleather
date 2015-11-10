# Toggler
# Uses 4 attributes: toggler-target, toggler-toggle, toggler-hide, toggler-show.
# All of these attributes require a value, which is used as a "key"
# When you click one of the triggers (toggler-{toggle, show, hide})
# it does what it says to the target with the matching key.

$ ()->
  
  # Add the click handlers to the various triggers
  ["toggle", "show", "hide"].forEach (action)->
    $ "[toggler-#{action}]"
      .click (e)->
        clicked = $ e.target
        key = clicked.attr "toggler-#{action}"
        target = $ "[toggler-target=#{key}]"
        target[action]()
  
  # Setup all the items to be toggled
  $ "[toggler-target]"
    .hide()
    .attr "toggler-ready", true
