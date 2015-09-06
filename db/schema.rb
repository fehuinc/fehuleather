# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2) do

  create_table "infos", force: :cascade do |t|
    t.integer "product_id"
    t.text    "content",    null: false
    t.text    "name",       null: false
  end

  add_index "infos", ["product_id"], name: "index_infos_on_product_id"

  create_table "kingdoms", force: :cascade do |t|
    t.text "name", null: false
  end

  add_index "kingdoms", ["name"], name: "index_kingdoms_on_name", unique: true

  create_table "merchants", force: :cascade do |t|
    t.text "phone_number", null: false
    t.text "email",        null: false
    t.text "your_name",    null: false
    t.text "store_name",   null: false
  end

  add_index "merchants", ["email"], name: "index_merchants_on_email", unique: true

  create_table "products", force: :cascade do |t|
    t.integer "kingdom_id"
    t.text    "name",                            null: false
    t.integer "cents_retail",    default: 0,     null: false
    t.integer "cents_wholesale", default: 0,     null: false
    t.boolean "show_retail",     default: false, null: false
    t.boolean "show_wholesale",  default: false, null: false
    t.integer "ypos",            default: 0,     null: false
  end

  add_index "products", ["kingdom_id"], name: "index_products_on_kingdom_id"
  add_index "products", ["name"], name: "index_products_on_name", unique: true

  create_table "stocks", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity",   default: 0, null: false
  end

  create_table "variant_stock_joins", force: :cascade do |t|
    t.integer "variant_id"
    t.integer "stock_id"
  end

  create_table "variants", force: :cascade do |t|
    t.integer "variation_id"
    t.boolean "default",         default: false, null: false
    t.text    "description"
    t.text    "name",                            null: false
    t.integer "cents_retail",    default: 0,     null: false
    t.integer "cents_wholesale", default: 0,     null: false
    t.boolean "show_retail",     default: false, null: false
    t.boolean "show_wholesale",  default: false, null: false
    t.integer "sort_order",      default: 0,     null: false
  end

  add_index "variants", ["variation_id"], name: "index_variants_on_variation_id"

  create_table "variations", force: :cascade do |t|
    t.integer "product_id"
    t.boolean "has_image",  default: false, null: false
    t.integer "level",      default: 0,     null: false
    t.text    "name",                       null: false
  end

  add_index "variations", ["product_id"], name: "index_variations_on_product_id"

end
