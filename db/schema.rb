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

ActiveRecord::Schema.define(version: 20170407105229) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"

  create_table "categories_products", force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id"
  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id"

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.integer  "main_color_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "colors", ["main_color_id"], name: "index_colors_on_main_color_id"

  create_table "main_colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "photos_product_data", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "product_datum_id"
  end

  add_index "photos_product_data", ["photo_id"], name: "index_photos_product_data_on_photo_id"
  add_index "photos_product_data", ["product_datum_id"], name: "index_photos_product_data_on_product_datum_id"

  create_table "photos_products", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "product_id"
  end

  add_index "photos_products", ["photo_id"], name: "index_photos_products_on_photo_id"
  add_index "photos_products", ["product_id"], name: "index_photos_products_on_product_id"

  create_table "product_data", force: :cascade do |t|
    t.integer  "color_id"
    t.integer  "size_id"
    t.integer  "article"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_data", ["color_id"], name: "index_product_data_on_color_id"
  add_index "product_data", ["product_id"], name: "index_product_data_on_product_id"
  add_index "product_data", ["size_id"], name: "index_product_data_on_size_id"

  create_table "product_product_sizes", force: :cascade do |t|
    t.boolean  "has"
    t.integer  "product_id"
    t.integer  "product_size_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "size"
  end

  add_index "product_product_sizes", ["product_id"], name: "index_product_product_sizes_on_product_id"
  add_index "product_product_sizes", ["product_size_id"], name: "index_product_product_sizes_on_product_size_id"

  create_table "product_sizes", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_sizes", ["category_id"], name: "index_product_sizes_on_category_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "about"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "img_alt_file_name"
    t.string   "img_alt_content_type"
    t.integer  "img_alt_file_size"
    t.datetime "img_alt_updated_at"
  end

end
