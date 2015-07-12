angular.module "Editable", []

.directive "editable", new Array "$http", "$timeout", ($http, $timeout)->
  scope: true
  transclude: true
  template: '
    <div ng-transclude></div>
    <a class="edit" ng-show="state == \'normal\'">Edit</a>
    <a class="save" ng-show="state == \'editing\'">Save</a>
    <a class="cancel" ng-show="state == \'editing\'">Cancel</a>
    <span ng-show="state == \'saving\'">Saving</span>
    <span ng-show="state == \'saved\'">Saved</span>
    <span ng-show="state == \'error\'">Error</span>
    '
  link: (scope, elm, attrs)->
    
    # LOCALS
    editButton = elm.find(".edit")
    saveButton = elm.find(".save")
    cancelButton = elm.find(".cancel")
    content = elm.find("[ng-transclude]").children()
    scope.state = "normal"
    startingText = null
    
    
    # HELPERS
    strip = (text)-> text.replace(/^\s+/, '').replace(/\s+$/, '')
    getText = ()-> strip content.text()
    setText = (text)-> content.text strip text
    revert = ()-> content.text startingText
    
    start = ()->
      startingText = getText()
      content.attr "contenteditable", true
      content.focus()
    
    stop = ()->
      content[0].blur()
      content.attr "contenteditable", false
    
    # STATE TRANSITIONS
    
    edit = ()->
      return unless scope.state is "normal"
      scope.state = "editing"
      start()
    
    save = ()->
      return unless scope.state is "editing"
      newText = getText()
      return cancel() if newText is startingText or newText.length is 0
      stop()
      scope.state = "saving"
      postData = {}
      postData[attrs.field] = newText
      $http.put attrs.path, postData
        .success (data, status, headers, config)->
          scope.state = "saved"
          $timeout (()-> scope.state = "normal"), 800
        .error (data, status, headers, config)->
          scope.state = "error"
    
    cancel = ()->
      return unless scope.state is "editing"
      scope.state = "normal"
      revert()
      stop()
    
    
    # EVENT HANDLING
    
    content.bind 'keydown', (e)->
      scope.$apply ()->
        switch e.keyCode
          when 13 # Return
            e.preventDefault()
            save()
          when 27 # Esc
            e.preventDefault()
            cancel()
    
    editButton.click ()-> scope.$apply edit
    saveButton.click ()-> scope.$apply save
    cancelButton.click ()-> scope.$apply cancel
    
