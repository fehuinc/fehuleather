class Product < ActiveRecord::Base
  has_many :infos, dependent: :destroy_all
  has_many :stocks
  has_many :variations
  belongs_to :kingdom
  
  validates :description, :kingdom, :name, presence: true
  validates :price_retail, :price_wholesale, numericality: true
  validates :name, uniqueness: { case_sensitive: false }
  
  before_destroy :ensure_safe_destroy
  
  def ensure_safe_destroy
    # Variations need to have 0 or 1 variants before they can be destroyed.
    # So first, let's kill their variants
    self.variations.each do |variation|
      variation.variants.destroy_all # Will also destroy stocks
    end
    
    # Now we're good!
    return true
  end
end
