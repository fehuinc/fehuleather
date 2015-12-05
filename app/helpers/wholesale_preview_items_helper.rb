module WholesalePreviewItemsHelper
  def wholesale_preview_items(merchant)
    items = merchant.current_order.items
    json = items.to_json methods: :wholesale_image
    return json.html_safe
  end
end
