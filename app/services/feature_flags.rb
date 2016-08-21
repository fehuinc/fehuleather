class FeatureFlags
  def self.check key
    name = "FEATURE_#{key.to_s.upcase}"
    return ENV.fetch(name) == "true"
  end
end
