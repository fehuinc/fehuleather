class Mails < ActionMailer::Base
  default from: "Fehu Inc. <ivan@fehuleather.com>"

  # ORDERS ########################################################################################

  def customer_retail_order(order)
    @order = order
    mail to: order.address.email, subject: "Your Order from Fehu"
  end

  def admin_retail_order(order)
    @order = order
    mail to: "ivan@fehuleather.com,freyja@fehuleather.com", subject: "New Retail Order!"
  end

  def customer_wholesale_order(email, order)
    @order = order
    mail to: email, subject: "Order Invoice from Fehu"
  end

  def admin_wholesale_order(order)
    @order = order
    mail to: "ivan@fehuleather.com,freyja@fehuleather.com", subject: "New Wholesale Order!"
  end

  def wholesale_order_accepted(order)
    @order = order
    mail to: order.merchant.email, subject: "Your Wholesale Order Invoice from Fehu"
  end


  # PASSWORD RESET ################################################################################


  def password_reset(merchant, host)
    @merchant = merchant
    @url = merchant_reset_password_url(merchant.password_reset_token, host:host)
    mail to: merchant.email, subject: "Reset Your Password", tag: "Password Reset - #{Rails.env}"
  end

end
