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

  create_table "family", force: :cascade do |t|
    t.text "description", null: false
    t.text "name",        null: false
  end

  add_index "family", ["name"], name: "index_family_on_name", unique: true

  create_table "genus", force: :cascade do |t|
    t.integer "kingdom_id"
    t.integer "family_id"
    t.text    "description",                                           null: false
    t.text    "name",                                                  null: false
    t.decimal "price_retail",    precision: 7, scale: 2, default: 0.0, null: false
    t.decimal "price_wholesale", precision: 7, scale: 2, default: 0.0, null: false
  end

  add_index "genus", ["family_id"], name: "index_genus_on_family_id"
  add_index "genus", ["kingdom_id"], name: "index_genus_on_kingdom_id"

  create_table "info", force: :cascade do |t|
    t.integer "family_id"
    t.text    "content",   null: false
    t.text    "name",      null: false
  end

  add_index "info", ["family_id"], name: "index_info_on_family_id"

  create_table "kingdom", force: :cascade do |t|
    t.text "name", null: false
  end

  add_index "kingdom", ["name"], name: "index_kingdom_on_name", unique: true

  create_table "species", force: :cascade do |t|
    t.integer "genus_id"
    t.text    "description"
    t.text    "name",                                                    null: false
    t.decimal "price_retail",    precision: 7, scale: 2, default: 0.0,   null: false
    t.decimal "price_wholesale", precision: 7, scale: 2, default: 0.0,   null: false
    t.boolean "show_retail",                             default: false, null: false
    t.boolean "show_wholesale",                          default: false, null: false
    t.integer "stock",                                   default: 0,     null: false
  end

  add_index "species", ["genus_id"], name: "index_species_on_genus_id"

end
