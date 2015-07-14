@imagePreviewFailed = (path)->
  
  $('.failed-previews')
    .addClass("show")
    .children("div")
    .append("<div>#{path}</div>")
