# Toggler
# Uses 4 attributes: toggler-target, toggler-toggle, toggler-hide, toggler-show.
# All of these attributes require a value, which is used as a "key"
# When you click one of the actions (toggler-{toggle, show, hide})
# it performs that action on the target with the matching key.

$ ()->
  makeHandler = (action)->
    $("[toggler-#{action}]").click (e)->
      key = $(e.target).attr "toggler-#{action}"
      $("[toggler-target=#{key}]")[action]()
  
  ["toggle", "show", "hide"].forEach makeHandler
  $("[toggler-target]").hide().attr("toggler-ready", true)
