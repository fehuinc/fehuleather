class Initialize < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    
    create_table :kingdoms do |t| # eg: belt, bracelet
      t.text :name,	                   null: false
      t.index :name,                   unique: true
    end
    
    create_table :products do |t| # eg: wrap cuff, belt bag, nude raw ring
      t.belongs_to :kingdom,           required: true, index: true
      t.text :name,                    null: false
      t.boolean :made_to_order,        default: false
      t.monetize :price_retail
      t.monetize :price_wholesale
      t.index :name,                   unique: true
    end
    
    create_table :variations do |t| # eg: yellow gilt cuff, cinnamon wrap cuff
      t.belongs_to :product,           required: true, index: true
      t.text :name,                    null: false
      t.text :description
      t.monetize :price_retail
      t.monetize :price_wholesale
    end
    
    create_table :sizes do |t|
      t.belongs_to :product,           required: true, index: true
      t.text :name,                    null: false
    end
    
    create_table :builds do |t|
      t.belongs_to :variation,         required: true, index: true
      t.belongs_to :size,              required: true, index: true
      t.text :model
      t.integer :stock,                default: 0
    end
    
    create_table :product_infos do |t| # eg: sizing, gifting, uniqueness, tips
      t.belongs_to :product,           required: true, index: true
      t.text :name,                    null: false
      t.text :content,                 null: false
    end
    
    create_table :totem_rows do |t|
      t.integer :index,	               default: 0
      t.index :index
    end
    
    create_table :totem_items do |t|
      t.belongs_to :totem_row,         required: true, index: true
      t.belongs_to :variation,         required: false
      t.text :name,                    null: false
      t.text :image,                   null: false
      t.text :content,                 null: false
      t.integer :ypos,                 default: 0
      t.integer :index,	               default: 0
      t.index :index
    end
    
    create_table :merchants do |t|
      t.references :current_order
      t.text :email,	                 null: false
      t.text :phone_number,            null: false
      t.text :store_name,              null: false
      t.text :your_name,               null: false
      t.text :encrypted_code
      t.index :email,                  unique: true
      t.timestamps
    end
    
    create_table :orders do |t|
      t.belongs_to :merchant,          required: false, index: true
      t.uuid :uuid,                    default: 'uuid_generate_v4()'
      t.text :notes
      t.datetime :submitted
      t.datetime :paid
      t.datetime :shipped
      t.timestamps
    end
    
    create_table :order_items do |t|
      t.belongs_to :order,             required: true, index: true
      
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
    end

    create_table :events do |t|
      t.text :name,	                   null: false
      t.text :date,	                   null: false
      t.text :location,	               null: false
      t.text :description
    end
  end
end
