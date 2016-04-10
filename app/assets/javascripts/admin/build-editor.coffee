Take "DOMContentLoaded", ()->
  
  makeUpdateFn = (id, prop, valFn)-> (e)->
    $.ajax
      url: "/admin/builds/#{id}"
      method: "PUT"
      data:
        prop: prop
        val: valFn $ e.target
      error: (r)->
        alert "Update failed, sorry hoo!"
        console.log r.responseText
      success: (r)->
        console.log r
  
  setup = (elm)->
    id = elm.attr "js-build-editor"
    elm.find("[js-build-editor-stock]").change makeUpdateFn id, "stock", (elm)-> elm.val()
    elm.find("[js-build-editor-retail]").change makeUpdateFn id, "show_retail", (elm)-> elm.prop "checked"
    elm.find("[js-build-editor-wholesale]").change makeUpdateFn id, "show_wholesale", (elm)-> elm.prop "checked"
  
  
  # INIT ###########################################################################################
  
  
  for elm in $ "[js-build-editor]"
    setup $ elm
