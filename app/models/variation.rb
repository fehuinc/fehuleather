class VariationNotEmpty < Exception; end

class Variation < ActiveRecord::Base
  belongs_to :product
  has_many :variants # TODO: Destroy in Stockhausen
  has_many :parts, class_name: ConfigurationPart # TODO: Destroy in Stockhausen
  has_many :configurations, through: :parts # TODO: Destroy in Stockhausen
  
  validates :name, :product, { presence: true }
  validates :level, { numericality: { only_integer: true } }
  
  # TODO: Check:
  before_destroy :ensure_safe_destroy
  
  def default_variant
    if default_variant_id.present?
      variants.find(default_variant_id) || variants.first
    else
      variants.first
    end
  end
  
  def ensure_safe_destroy
    # It's only safe to delete a variation when it contains 0 or 1 variants
    raise VariationNotEmpty if self.variants.count > 1
    
    # If we have a variant, we need to mess with its configurations a bit before we die
    if variant = self.variants.first
      
      # If this is the last variation, we need to delete all configurations
      if product.variations.count == 1
        self.product.configurations.delete_all
      
      # This is not the last variation — delete all variants
      # That will take care of extracting the variant from configurations
      else
        self.variants.destroy_all
      end
    end
    
    return true
  end
end
