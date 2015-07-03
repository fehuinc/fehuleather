

module NgHelper
  def ng_helper
    if controller_name == "static" && action_name == "index"
      # We don't put quotes around the FehuApp because they're automatic.. for some reason.
      "ng-app=FehuApp page-style"
    else
      ""
    end
  end
end
