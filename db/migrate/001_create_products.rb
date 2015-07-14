class CreateProducts < ActiveRecord::Migration
  def change
    create_table :kingdoms do |t| # eg: belt, bracelet
      # has many :products
      t.text :name,	              null: false
      t.index :name,              unique: true
    end
    
    create_table :products do |t| # eg: wrap cuff, belt bag, nude raw ring
      # has many :infos
      # has many :stocks
      # has many :variations
      t.belongs_to :kingdom,      required: true, index: true
      t.text :description,        null: false
      t.text :name,               null: false
      t.integer :cents_retail,    null: false, default: 0
      t.integer :cents_wholesale, null: false, default: 0
      t.boolean :published,       null: false, default: false
      t.boolean :show_retail,     null: false, default: false
      t.boolean :show_wholesale,  null: false, default: false
      t.integer :totem_levels,    null: false, default: 1
      t.index :name,              unique: true
    end
    
    create_table :infos do |t| # eg: sizing, gifting, uniqueness, tips
      t.belongs_to :product,      required: true, index: true
      t.text :content,            null: false
      t.text :name,               null: false
    end
    
    create_table :variations do |t| # eg: color, hardware, size, leaf pattern
      # has many :variants
      t.belongs_to :product,      required: true, index: true
      t.text :description,        default: nil
      t.boolean :has_image,       null: false, default: false
      t.integer :level,           null: false, default: 0
      t.text :name,               null: false
    end
    
    create_table :variants do |t| # eg: red, brass, small, stripes
      # has many :variant_stock_joins
      t.belongs_to :variation,    required: true, index: true
      t.boolean :default,         null: false, default: false
      t.text :description,        default: nil
      t.text :name,               null: false
      t.integer :cents_retail,    null: false, default: 0
      t.integer :cents_wholesale, null: false, default: 0
      t.boolean :published,       null: false, default: false
      t.boolean :show_retail,     null: false, default: false
      t.boolean :show_wholesale,  null: false, default: false
      t.integer :sort_order,      null: false, default: 0
    end
    
    create_table :variant_stock_joins do |t|
      t.belongs_to :variant,      required: true
      t.belongs_to :stock,        required: true
    end
    
    create_table :stocks do |t| # how many units are in stock
      # has many :variant_stock_joins
      t.belongs_to :product,      required: true
      t.integer :quantity,        null: false, default: 0
    end
  end
end
