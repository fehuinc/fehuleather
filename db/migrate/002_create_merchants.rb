class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.text :phone_number,         null: false
      t.text :email,	              null: false
      t.text :your_name,            null: false
      t.text :store_name,           null: false
      t.index :email,               unique: true
    end
  end
end
