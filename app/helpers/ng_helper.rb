module NgHelper
  def ng_helper
    if controller_name == "angular"
      # We don't put quotes around the FehuApp because they're automatic.. for some reason.
      "ng-app=PublicApp page-style"
    elsif %w(wholesale merchant orders).include? controller_name
      "ng-app=WholesaleApp page-style"
    else
      # Still include angular, because we might use it on forms and such
      "ng-app=CoreApp"
    end
  end
end
