class LaunchWholesale < ActiveRecord::Migration[5.2]
  def change

    add_column :merchants, :password_digest, :string
    add_column :merchants, :tax_id_number, :string

  end
end
