class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      # has many :orders
      # has one :current_order
      t.text :phone_number,        null: false
      t.text :email,	             null: false
      t.text :your_name,           null: false
      t.text :store_name,          null: false
      t.index :email,              unique: true
      t.timestamps
    end
    
    create_table :orders do |t|
      # has many :items
      t.belongs_to :merchant,      required: true, index: true
      t.timestamps
    end
    
    create_table :items do |t|
      t.belongs_to :order,         required: true, index: true
      t.text :name,                null: false
      t.integer :quantity,         null: false, default: 0
      t.integer :cents,            null: false, default: 0
    end
    
    create_table :current_orders do |t|
      # has many :current_order_stock_joins
      t.belongs_to :merchant,      required: true, index: true
      t.timestamps
    end
    
    create_table :current_order_stock_joins do |t|
      t.belongs_to :current_order, required: true
      t.belongs_to :stock,         required: true
    end
    
  end
end
