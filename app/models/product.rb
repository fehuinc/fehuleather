class Product < ActiveRecord::Base
  belongs_to :kingdom
  has_many :infos, dependent: :delete_all
  has_many :variations # TODO: Destroy in Stockhausen
  has_many :configurations # TODO: Create/Destroy in Stockhausen
  
  validates :kingdom, :name, { presence: true }
  validates :cents_retail, :cents_wholesale, :totem_order, :ypos, { numericality: { only_integer: true } }
  validates :name, { uniqueness: { case_sensitive: false } }
  
  # TODO: Check:
  before_destroy :ensure_safe_destroy
  
  def price_retail
    cents_retail.to_d / 100
  end
  
  def price_retail=(price)
    self.cents_retail = (price.to_d * 100).to_i if price.present?
  end
  
  def price_wholesale
    cents_wholesale.to_d / 100
  end

  def price_wholesale=(price)
    self.cents_wholesale = (price.to_d * 100).to_i if price.present?
  end
  
  def image(type)
    variantNames = variations.where(has_image: true).order(:level).map(&:default_variant).map(&:name)
    return Images.build_path(name, variantNames, type)
  end
  
  def ensure_safe_destroy
    # Variations need to have 0 or 1 variants before they can be destroyed, so we gotta kill 'um manually.
    
    # Kill all variations, variants, and variant_stock_joins
    self.variations.each do |variation|
      # variation.variants.destroy_all
      variation.variants.each do |variant|
        variant.variant_stock_joins.delete_all
      end
      variation.variants.delete_all
    end
    self.variations.delete_all
    
    # Now we're good!
    return true
  end
end
