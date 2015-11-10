class Order < ActiveRecord::Base
  # ASSUMPTIONS
  ## Orders are never deleted
  
  belongs_to :merchant # Optional — will be nil if this is a retail order
  has_many :order_items
  
  enum status: [:open, :submitted, :paid, :shipped] # WARNING: ENUM! APPEND ONLY!
  
  # TODO: What do I do to validate the enum?? Something like.... (?)
  # validates :status, { presence: true, numericality: { only_integer: true } }
  
  def update_items(configHash, wholesale = false)
    result = {}
    configHash.each do |k,v| # This is a hack to map over a hash
      configuration_id = v[:id]
      quantity = v[:quantity].to_i
      
      order_item = order_items.where(configuration_id: configuration_id).first
      
      if quantity > 0
        order_item = add_item(configuration_id, wholesale) if order_item.nil?
        order_item.quantity = quantity
        saved = order_item.save
        result[k] = saved
      elsif order_item.present?
        destroyed = order_item.destroy!
        result[k] = destroyed
      else
        result[k] = "Nothing"
      end
    end
    result
  end
  
  def add_item(configuration_id, wholesale = false)
    if configuration = Configuration.find(configuration_id)
      cents = configuration.price(wholesale) * 100
      item = order_items.create configuration_id: configuration.id,
                                name: configuration.name,
                                cents: cents
    end
  end
  
end
