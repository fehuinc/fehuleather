require_relative '../../app/services/feature_flags'

RSpec.describe FeatureFlags do
  it "check is  true when the feature is enabled" do
    allow(ENV).to receive(:[]).with("FEATURE_SPEC").and_return("true")
    expect(FeatureFlags.check(:spec)).to eq(true)
  end
  
  it "check is false when the feature is disabled" do
    allow(ENV).to receive(:[]).with("FEATURE_SPEC").and_return("false")
    expect(FeatureFlags.check(:spec)).to eq(false)
  end
  
  it "check is false when the feature is not specified" do
    allow(ENV).to receive(:[]).with("FEATURE_NOT_A_FEATURE").and_return(nil)
    expect(FeatureFlags.check(:not_a_feature)).to eq(false)
  end
end
