class FeatureFlags
  def self.check key
    case key
    when :retail then false
    when :wholesale then false
    else false
    end
  end
end
