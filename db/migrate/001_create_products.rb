class CreateProducts < ActiveRecord::Migration
  def change
    create_table :kingdom do |t|
      t.text :name,	              null: false
      t.index :name,              unique: true
    end
    
    create_table :family do |t|
      t.text :description,        null: false
      t.text :name,               null: false
      t.index :name,              unique: true
    end
    
    create_table :genus do |t|
      t.belongs_to :kingdom,      required: true, index: true
      t.belongs_to :family,       required: true, index: true
      t.text :description,        null: false
      t.text :name,               null: false
      t.decimal :price_retail,    null: false, default: 0, precision: 7, scale: 2
      t.decimal :price_wholesale, null: false, default: 0, precision: 7, scale: 2
    end
    
    create_table :species do |t|
      t.belongs_to :genus,        required: true, index: true
      t.text :description,        default: nil
      t.text :name,               null: false
      t.decimal :price_retail,    null: false, default: 0, precision: 7, scale: 2
      t.decimal :price_wholesale, null: false, default: 0, precision: 7, scale: 2
      t.boolean :show_retail,     null: false, default: false
      t.boolean :show_wholesale,  null: false, default: false
      t.integer :stock,           null: false, default: 0
    end
    
    create_table :info do |t|
      t.belongs_to :family,       required: true, index: true
      t.text :content,            null: false
      t.text :name,               null: false
    end
  end
end
