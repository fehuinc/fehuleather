module WholesalePreviewHelper
  def preview_order_items_json(order)
    items = order.items.includes(build: [:product, :size, :variation])
    json = items.to_json(
      only: [:id, :quantity],
      include: {
        build: {
          only: [:id],
          methods: [:price_wholesale],
          include: {
            product: { only: [:name, :id] },
            size: { only: :name },
            variation: { only: [:name, :wholesale_image] }
          }
        }
      }
    )
    return json.html_safe
  end
end
