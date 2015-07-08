module NgHelper
  def ng_helper
    if controller_name == "angular"
      # We don't put quotes around the FehuApp because they're automatic.. for some reason.
      "ng-app=FehuApp page-style"
    else
      # Still include angular, because we might use it on forms and such
      "ng-app"
    end
  end
end
