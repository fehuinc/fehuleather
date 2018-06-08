class OrderMailer < ActionMailer::Base
  default from: "Fehu Inc. <ivan@fehuleather.com>"

  def customer_retail_order(order)
    @order = order
    mail to: order.address.email, subject: "Your Order from Fehu"
  end

  def admin_retail_order(order)
    @order = order
    mail to: "ivan@fehuleather.com", subject: "A Retail Stink!"
  end

  def customer_wholesale_order(email, order)
    @order = order
    mail to: email, subject: "Order Invoice from Fehu"
  end

  def admin_wholesale_order(order)
    @order = order
    mail to: "ivan@fehuleather.com", subject: "A Retail Stink!"
  end

end
