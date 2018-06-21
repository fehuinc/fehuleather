class LaunchWholesale < ActiveRecord::Migration[5.2]
  def change

    add_column :merchants, :password_digest, :string, null: false
    add_column :merchants, :password_reset_token, :string
    add_column :merchants, :password_reset_sent_at, :string
    add_column :merchants, :password_reset_expires_at, :string
    add_column :merchants, :tax_id_number, :string, null: false

    add_column :wholesale_orders, :accepted, :datetime
    add_column :wholesale_orders, :tracking_number, :text
    add_column :retail_orders, :tracking_number, :text

  end
end
