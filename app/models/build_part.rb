class BuildPart < ActiveRecord::Base
  belongs_to :build
  belongs_to :variant
  belongs_to :variation
  
  validates :build, :variant, :variation, { presence: true }
end
