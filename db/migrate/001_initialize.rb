class Initialize < ActiveRecord::Migration[4.2]
  def change
    enable_extension 'uuid-ossp'

    create_table :products do |t|
      t.text :name,                    null: false
      t.text :description_retail,      default: ""
      t.text :description_wholesale,   default: ""
      t.monetize :price_retail
      t.monetize :price_wholesale
      t.timestamps
      t.index :name,                   unique: true
    end

    create_table :variations do |t|
      t.belongs_to :product,           required: true, index: true
      t.text :name,                    null: false
      t.text :model
      t.text :totem_image
      t.text :wholesale_image
      t.text :description_retail,      default: ""
      t.text :description_wholesale,   default: ""
      t.monetize :adjust_retail,       default: 0
      t.monetize :adjust_wholesale,    default: 0
      t.timestamps
      t.index :name
    end

    create_table :sizes do |t|
      t.belongs_to :product,           required: true, index: true
      t.text :name,                    null: false
      t.timestamps
      t.index :name
    end

    create_table :builds do |t|
      t.belongs_to :variation,         required: true, index: true
      t.belongs_to :size,              required: true, index: true
      t.text :model
      t.integer :stock,                default: 1
      t.boolean :show_retail,          null: false, default: true
      t.boolean :show_wholesale,       null: false, default: true
      t.timestamps
      t.index :stock
    end

    create_table :totem_rows do |t|
      t.integer :index,	               default: 0
      t.timestamps
      t.index :index
    end

    create_table :totem_items do |t|
      t.belongs_to :totem_row,         required: true, index: true
      t.belongs_to :variation,         required: false
      t.text :name
      t.text :image
      t.text :content
      t.integer :index,	               default: 0
      t.timestamps
      t.index :index
    end

    create_table :merchants do |t|
      t.references :current_order
      t.text :email,	                 null: false
      t.text :phone_number,            null: false
      t.text :store_name,              null: false
      t.text :your_name,               null: false
      t.text :secret_code                           # AKA: Password
      t.timestamps
      t.index :email,                  unique: true
      t.index :store_name,             unique: true
    end

    create_table :addresses do |t|
      t.references :merchant,          index: true
      t.text :name, 	                 null: false
      t.text :email,	                 null: false
      t.text :line1,                   null: false
      t.text :line2
      t.text :city,                    null: false
      t.text :code,                    null: false # Zip/Postal
      t.text :region,                  null: false # Province/State
      t.text :country,                 null: false
      t.timestamps
    end

    create_table :retail_orders do |t|
      t.references :address            # Not required. It should be safe to delete the order address after a while, for PII reasons
      t.uuid :uuid,                    default: 'uuid_generate_v4()'
      t.text :notes
      t.text :payment_id
      t.timestamps
    end

    create_table :wholesale_orders do |t|
      t.belongs_to :merchant,          required: true, index: true
      t.references :address,           required: true
      t.uuid :uuid,                    default: 'uuid_generate_v4()'
      t.text :orderInfo
      t.text :payment_id
      t.datetime :submitted
      t.datetime :paid
      t.datetime :shipped
      t.timestamps
    end

    create_table :order_items do |t|
      t.belongs_to :order,             polymorphic: true, required: true, index: true

      # This is useful while the order is being created.
      # After the order has been submitted, we probably won't need it.
      t.references :build,             required: false, index: true

      # These will remain correct, even if the build is changed/deleted
      t.text :build_name,              null: false
      t.text :product_name,            null: false
      t.monetize :price
      t.integer :quantity,             null: false
      t.timestamps
    end

    create_table :locations do |t|
      t.text :name,	                   null: false
      t.text :url
      t.text :phone
      t.text :address
      t.text :city
      t.text :province
      t.text :postal
      t.text :country
      t.boolean :visible,              null: false, default: true
      t.timestamps
    end

    create_table :events do |t|
      t.text :name,	                   null: false
      t.text :date,	                   null: false
      t.text :location,	               null: false
      t.text :website
      t.text :description
      t.timestamps
    end
  end
end
