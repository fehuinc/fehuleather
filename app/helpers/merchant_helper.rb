module MerchantHelper
  def merchant?
    session[:merchant_id].present?
  end
  
  def merchant_name
    if merchant?
      Merchant.find(session[:merchant_id]).store_name
    else
      "Not Logged In"
    end
  end
end
