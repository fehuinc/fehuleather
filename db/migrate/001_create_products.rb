class CreateProducts < ActiveRecord::Migration
  def change
    create_table :kingdoms do |t| # eg: belt, bracelet
      t.text :name,	               null: false
      t.index :name,               unique: true
    end
    
    create_table :products do |t| # eg: wrap cuff, belt bag, nude raw ring
      t.belongs_to :kingdom,       required: true, index: true
      t.text :name,                null: false
      t.integer :cents_retail,     null: false, default: 0
      t.integer :cents_wholesale,  null: false, default: 0
      t.boolean :show_retail,      null: false, default: false
      t.boolean :show_wholesale,   null: false, default: false
      t.integer :totem_order,      null: false, default: 0
      t.integer :ypos,             null: false, default: 0
      t.index :name,               unique: true
    end
    
    create_table :variations do |t| # eg: color, hardware, size, leaf pattern
      t.belongs_to :product,      required: true, index: true
      t.boolean :has_image,       null: false, default: false
      t.integer :level,           null: false, default: 0
      t.text :name,               null: false
    end
    
    create_table :variants do |t| # eg: red, brass, small, stripes
      t.belongs_to :variation,    required: true, index: true
      t.boolean :default,         null: false, default: false
      t.text :description,        default: nil
      t.text :name,               null: false
      t.integer :cents_retail,    null: false, default: 0
      t.integer :cents_wholesale, null: false, default: 0
      t.boolean :show_retail,     null: false, default: false
      t.boolean :show_wholesale,  null: false, default: false
      t.integer :sort_order,      null: false, default: 0
    end
    
    create_table :infos do |t| # eg: sizing, gifting, uniqueness, tips
      t.belongs_to :product,      required: true, index: true
      t.text :name,               null: false
      t.text :content,            null: false
    end
    
    create_table :configurations do |t|
      t.belongs_to :product,      required: true, index: true
      t.integer :stock,           null: false, default: 0
    end
    
    create_table :configuration_variants do |t|
      t.belongs_to :configuration, required: true, index: true
      t.references :variant,       required: true, index: true
    end
    
    create_table :customer do |t|
      t.text :email,	             null: false
      t.text :phone_number,        null: false
      t.text :name,                null: false
      t.timestamps
      t.index :email,              unique: true
    end
    
    create_table :merchants do |t|
      t.references :customer,      required: true, index: true
      t.text :store_name,          null: false
    end
    
    create_table :orders do |t|
      t.belongs_to :customer,      required: true, index: true
      t.integer :status,           null:false, default: 0
      t.timestamps
    end
    
    create_table :items do |t|
      t.belongs_to :order,         required: true, index: true
      
      # This is useful while the order is being created.
      # After the order has been submitted, we probably won't need it.
      t.references :configuration, required: true, index: true
      
      # These will remain correct, even if the configuration is changed/deleted
      t.text :name,                null: false
      t.integer :cents,            null: false, default: 0
      
      t.integer :quantity,         null: false, default: 0
      t.timestamps
    end
  end
end
