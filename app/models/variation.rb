class VariationNotEmpty < Exception; end

class Variation < ActiveRecord::Base
  has_many :variants
  belongs_to :product
  
  validates :name, :product, presence: true
  validates :level, numericality: { only_integer: true }
  
  before_destroy :ensure_safe_destroy
  
  def ensure_safe_destroy
    # It's only safe to delete a variation when it contains 0 or 1 variants
    if self.variants.count > 1
      raise VariationNotEmpty
    
    # If we have 0 variants, we're done
    elsif self.variants.count == 0
      return true
    
    # We have 1 variant, and must first clean it up
    else
      variant = self.variants.first
      
      # If this is the last variation, we need to delete all stocks
      if product.variations.count == 1
        self.product.stocks.delete_all
      
      # This is not the last variation — delete all variants
      else
        self.variants.destroy_all
      end
    end
    
    return true
  end
end
