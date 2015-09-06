module StyleHelper
  def style_controller
    controller_name.parameterize
  end
  
  def style_action
    case name = action_name.parameterize
      when "create" then "new"
      when "update" then "edit"
      else name
    end
  end
end
