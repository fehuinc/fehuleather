$ ()->
  if $ "body.images"
    uploadData = null
    
    fileInput = $ "input:file"
    form = $ "form"
    preview = $ ".preview"
    progressBar = $ ".progress-bar"
    submitButton = $ "input[type='submit']"
    reader = new FileReader()
    
    reader.onload = ()->
      md5 reader.result
      uploadData?.submit()
    
    fileInput.fileupload
      fileInput: fileInput
      url: form.data("url")
      type: "POST"
      autoUpload: true
      formData: form.data("form-data")
      paramName: "file" # S3 does not like nested name fields i.e. name="user[avatar_url]"
      dataType: "XML"
      replaceFileInput: false

      add: (e, data)->
        fileInput.hide()
        progressBar.show().css("width", "10%")
        uploadData = data
        data.files[0].name = "IVAN"
        reader.readAsText(fileInput[0].files[0])

      start: (e)->
        fileInput.css "background", null

      progressall: (e, data)->
        progress = parseInt (data.loaded / data.total * 90) + 10
        progressBar.css("width", progress + "%")
      
      done: (e, data)->
        progressBar.hide()
        submitButton.show()
        
        key = $(data.jqXHR.responseXML).find("Key").text()
        host = form.data "host"
        url = "https://#{host}/#{key}"
        
        input = $("<input />", { type:"hidden", name: fileInput.attr("name"), value: url })
        form.append(input)
        
        preview.html("<img src='#{url}'>")
        
      fail: (e, data)->
        fileInput.show().css("background", "red")
        progressBar.hide()
