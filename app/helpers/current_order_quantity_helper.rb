module CurrentOrderQuantityHelper
  def current_order_quantity(order, build)
    if item = order.item_for_build(build)
      item.quantity
    else
      0
    end
  end
end
