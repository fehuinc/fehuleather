$ ()->
  
  for t in $("form")
    $(t).on 'submit', ()->
      $(t).find("[type=submit]").addClass("active")
        
    
