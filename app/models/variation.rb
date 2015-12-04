class VariationNotEmpty < Exception; end

class Variation < ActiveRecord::Base
  belongs_to :product
  has_many :variants # TODO: Destroy in Stockhausen
  has_many :parts, class_name: BuildPart # TODO: Destroy in Stockhausen
  has_many :builds, through: :parts # TODO: Destroy in Stockhausen
  
  validates :name, :product, { presence: true }
  validates :level, { numericality: { only_integer: true } }
  
  default_scope { order('level ASC') }
  
  # TODO: Check:
  before_destroy :ensure_safe_destroy
  
  def default_variant_retail
    retail_variants = variants.where(show_retail: true)
    return retail_variants.where(featured: true).first || retail_variants.first
  end
  
  def default_variant_wholesale
    retail_variants = variants.where(show_wholesale: true)
    return retail_variants.where(featured: true).first || retail_variants.first
  end
  
  def ensure_safe_destroy
    # It's only safe to delete a variation when it contains 0 or 1 variants
    raise VariationNotEmpty if self.variants.count > 1
    
    # If we have a variant, we need to mess with its builds a bit before we die
    if variant = self.variants.first
      
      # If this is the last variation, we need to delete all builds
      if product.variations.count == 1
        self.product.builds.delete_all
      
      # This is not the last variation — delete all variants
      # That will take care of extracting the variant from builds
      else
        self.variants.destroy_all
      end
    end
    
    return true
  end
end
