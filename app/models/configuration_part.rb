class ConfigurationPart < ActiveRecord::Base
  belongs_to :configuration
  belongs_to :variant
  belongs_to :variation
  
  validates :configuration, :variant, :variation, { presence: true }
end
