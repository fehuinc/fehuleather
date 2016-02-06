Take ["MD5", "DOMContentLoaded"], (MD5)->
  minWidth = 15 # minimum % width of the progress bar
  
  enableSubmit = (submitButton, enable = true)->
    count = (submitButton.prop("disable-count") || 0)
    count += if enable then -1 else 1
    submitButton.prop("disable-count", count)
    
    if !enable
      submitButton.hide()
    else if count == 0
      submitButton.show()
    
    
  $(".image-uploader").each (_, elm)->
    uploadData = null
    reader = new FileReader()
    
    iu = $ elm
    presignedPost = iu.data "presigned-post"
    fileInput = iu.find "input:file"
    form = iu.parent "form"
    preview = iu.find ".preview"
    progressBar = iu.find ".progress-bar"
    submitButton = iu.find "input[type='submit']"
    
    reader.onload = ()->
      hash = MD5 reader.result
      ext = uploadData.files[0].name.split(".").pop().toLowerCase()
      fields = presignedPost.fields
      fields.key = hash + "." + ext
      fileInput.fileupload 'option', 'formData', fields
      uploadData?.submit()
    
    fileInput.fileupload
      url: presignedPost.url
      type: "POST"
      paramName: "file" # S3 does not like nested name fields i.e. name="user[avatar_url]"
      dataType: "XML"
      replaceFileInput: false

      add: (e, data)->
        fileInput.hide()
        progressBar.show().css("width", "#{minWidth}%")
        uploadData = data
        enableSubmit(submitButton, false)
        reader.readAsText(fileInput[0].files[0])
      
      start: (e)->
        fileInput.css "background", null

      progressall: (e, data)->
        progress = parseInt (data.loaded / data.total * (100 - minWidth)) + minWidth
        progressBar.css("width", progress + "%")
      
      done: (e, data)->
        progressBar.hide()
        fileInput.show()
        enableSubmit(submitButton)
        
        key = $(data.jqXHR.responseXML).find("Key").text()
        host = presignedPost.host
        url = "https://#{host}/#{key}"
        
        input = $("<input />", { type:"hidden", name: fileInput.attr("name"), value: url })
        form.append(input)
        
        preview.html("<img src='#{url}'>")
        
      fail: (e, data)->
        fileInput.show().css("background", "red")
        progressBar.hide()
        enableSubmit(submitButton)
