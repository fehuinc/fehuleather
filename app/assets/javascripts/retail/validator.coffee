Take [], ()->
  Make "Validator", Validator =
    quantity: (raw)->
      Math.max 0, Math.round raw
