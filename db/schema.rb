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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.integer "merchant_id"
    t.text "name", null: false
    t.text "email", null: false
    t.text "line1", null: false
    t.text "line2"
    t.text "city", null: false
    t.text "code", null: false
    t.text "region", null: false
    t.text "country", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["merchant_id"], name: "index_addresses_on_merchant_id"
  end

  create_table "builds", id: :serial, force: :cascade do |t|
    t.integer "variation_id"
    t.integer "size_id"
    t.text "model"
    t.integer "stock", default: 1
    t.boolean "show_retail", default: true, null: false
    t.boolean "show_wholesale", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["size_id"], name: "index_builds_on_size_id"
    t.index ["stock"], name: "index_builds_on_stock"
    t.index ["variation_id"], name: "index_builds_on_variation_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "date", null: false
    t.text "location", null: false
    t.text "website"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "url"
    t.text "phone"
    t.text "address"
    t.text "city"
    t.text "province"
    t.text "postal"
    t.text "country"
    t.boolean "visible", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", id: :serial, force: :cascade do |t|
    t.integer "current_order_id"
    t.text "email", null: false
    t.text "phone_number", null: false
    t.text "store_name", null: false
    t.text "your_name", null: false
    t.text "secret_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_merchants_on_email", unique: true
    t.index ["store_name"], name: "index_merchants_on_store_name", unique: true
  end

  create_table "order_items", id: :serial, force: :cascade do |t|
    t.string "order_type"
    t.integer "order_id"
    t.integer "build_id"
    t.text "build_name", null: false
    t.text "product_name", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "CAD", null: false
    t.integer "quantity", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["build_id"], name: "index_order_items_on_build_id"
    t.index ["order_type", "order_id"], name: "index_order_items_on_order_type_and_order_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "description_retail", default: ""
    t.text "description_wholesale", default: ""
    t.integer "price_retail_cents", default: 0, null: false
    t.string "price_retail_currency", default: "CAD", null: false
    t.integer "price_wholesale_cents", default: 0, null: false
    t.string "price_wholesale_currency", default: "CAD", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "retail_orders", id: :serial, force: :cascade do |t|
    t.integer "address_id"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }
    t.text "notes"
    t.text "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizes", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.text "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_sizes_on_name"
    t.index ["product_id"], name: "index_sizes_on_product_id"
  end

  create_table "totem_items", id: :serial, force: :cascade do |t|
    t.integer "totem_row_id"
    t.integer "variation_id"
    t.text "name"
    t.text "image"
    t.text "content"
    t.integer "index", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["index"], name: "index_totem_items_on_index"
    t.index ["totem_row_id"], name: "index_totem_items_on_totem_row_id"
  end

  create_table "totem_rows", id: :serial, force: :cascade do |t|
    t.integer "index", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["index"], name: "index_totem_rows_on_index"
  end

  create_table "variations", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.text "name", null: false
    t.text "model"
    t.text "totem_image"
    t.text "wholesale_image"
    t.text "description_retail", default: ""
    t.text "description_wholesale", default: ""
    t.integer "adjust_retail_cents", default: 0, null: false
    t.string "adjust_retail_currency", default: "CAD", null: false
    t.integer "adjust_wholesale_cents", default: 0, null: false
    t.string "adjust_wholesale_currency", default: "CAD", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_variations_on_name"
    t.index ["product_id"], name: "index_variations_on_product_id"
  end

  create_table "wholesale_orders", id: :serial, force: :cascade do |t|
    t.integer "merchant_id"
    t.integer "address_id"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }
    t.text "orderInfo"
    t.text "payment_id"
    t.datetime "submitted"
    t.datetime "paid"
    t.datetime "shipped"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["merchant_id"], name: "index_wholesale_orders_on_merchant_id"
  end

end
