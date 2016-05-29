module FeatureFlagHelper
  def feature_flag key
    FeatureFlags.check key
  end
end
