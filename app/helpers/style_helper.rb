module StyleHelper
  def body_class
    controller_name.parameterize
  end
  
  def body_id
    case name = action_name.parameterize
      when "create" then "new"
      when "update" then "edit"
      else name
    end
  end
end
