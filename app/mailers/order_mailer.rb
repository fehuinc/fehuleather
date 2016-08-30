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
  
end
