module WholesalePreviewItemsHelper
  def wholesale_preview_items(merchant)
    items = merchant.current_order.items
    json = items.to_json methods: :wholesale_image, except: [:id, :order_id, :created_at, :updated_at]
    return json.html_safe
  end
end
