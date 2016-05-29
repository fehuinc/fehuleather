class FeatureFlags
  def self.check key
    case key
    when :store then false
    else false
    end
  end
end
