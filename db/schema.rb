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

ActiveRecord::Schema.define(version: 1) do

  create_table "configuration_parts", force: :cascade do |t|
    t.integer "configuration_id"
    t.integer "variant_id"
    t.integer "variation_id"
  end

  add_index "configuration_parts", ["configuration_id"], name: "index_configuration_parts_on_configuration_id"
  add_index "configuration_parts", ["variant_id"], name: "index_configuration_parts_on_variant_id"
  add_index "configuration_parts", ["variation_id"], name: "index_configuration_parts_on_variation_id"

  create_table "configurations", force: :cascade do |t|
    t.integer "product_id"
    t.integer "stock",      default: 0, null: false
  end

  add_index "configurations", ["product_id"], name: "index_configurations_on_product_id"

  create_table "kingdoms", force: :cascade do |t|
    t.text "name", null: false
  end

  add_index "kingdoms", ["name"], name: "index_kingdoms_on_name", unique: true

  create_table "locations", force: :cascade do |t|
    t.text "name",     null: false
    t.text "url"
    t.text "phone"
    t.text "address"
    t.text "city"
    t.text "province"
    t.text "postal"
    t.text "country"
  end

  create_table "merchants", force: :cascade do |t|
    t.integer  "current_order_id"
    t.text     "email",            null: false
    t.text     "phone_number",     null: false
    t.text     "store_name",       null: false
    t.text     "your_name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchants", ["email"], name: "index_merchants_on_email", unique: true

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "configuration_id"
    t.text     "name",                         null: false
    t.integer  "cents",            default: 0, null: false
    t.integer  "quantity",         default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["configuration_id"], name: "index_order_items_on_configuration_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "merchant_id"
    t.integer  "status",      default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["merchant_id"], name: "index_orders_on_merchant_id"

  create_table "product_infos", force: :cascade do |t|
    t.integer "product_id"
    t.text    "name",       null: false
    t.text    "content",    null: false
  end

  add_index "product_infos", ["product_id"], name: "index_product_infos_on_product_id"

  create_table "products", force: :cascade do |t|
    t.integer "kingdom_id"
    t.text    "name",                            null: false
    t.boolean "show_retail",     default: false, null: false
    t.boolean "show_wholesale",  default: false, null: false
    t.integer "cents_retail",    default: 0,     null: false
    t.integer "cents_wholesale", default: 0,     null: false
    t.integer "totem_order",     default: 0,     null: false
    t.integer "ypos",            default: 0,     null: false
  end

  add_index "products", ["kingdom_id"], name: "index_products_on_kingdom_id"
  add_index "products", ["name"], name: "index_products_on_name", unique: true

  create_table "variants", force: :cascade do |t|
    t.integer "variation_id"
    t.text    "name",                            null: false
    t.text    "description"
    t.boolean "show_retail",     default: false, null: false
    t.boolean "show_wholesale",  default: false, null: false
    t.integer "cents_retail",    default: 0,     null: false
    t.integer "cents_wholesale", default: 0,     null: false
    t.integer "sort_order",      default: 0,     null: false
  end

  add_index "variants", ["variation_id"], name: "index_variants_on_variation_id"

  create_table "variations", force: :cascade do |t|
    t.integer "product_id"
    t.integer "default_variant_id"
    t.text    "name",                               null: false
    t.boolean "has_image",          default: false, null: false
    t.integer "level",              default: 0,     null: false
  end

  add_index "variations", ["product_id"], name: "index_variations_on_product_id"

end
