class Store < ActiveRecord::Base
  
  def display_name
    if name.present?
      name
    elsif store_name.present?
      store_name
    elsif email.present?
      email
    elsif phone.present?
      phone
    else
      "No Name"
    end
  end
end
