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

ActiveRecord::Schema.define(version: 20140522023507) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "desc"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.string   "no"
    t.string   "name"
    t.integer  "quantity"
    t.integer  "point"
    t.decimal  "price",      precision: 20, scale: 2, default: 0.0
    t.decimal  "amount",     precision: 20, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer "user_id"
    t.integer "city_id"
  end

  create_table "goods", force: true do |t|
    t.string   "name"
    t.string   "no"
    t.string   "icon"
    t.integer  "goods_cate_id"
    t.integer  "goods_type_id"
    t.integer  "brand_id"
    t.integer  "vendor_id"
    t.text     "brief"
    t.text     "intro"
    t.string   "unit"
    t.string   "keywords"
    t.boolean  "sellable",                               default: true
    t.decimal  "mk_price",      precision: 20, scale: 2, default: 0.0
    t.decimal  "price",         precision: 20, scale: 2, default: 0.0
    t.string   "weight"
    t.integer  "point",                                  default: 0
    t.integer  "store",                                  default: 0
    t.text     "params_desc"
    t.text     "pdt_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_cates", force: true do |t|
    t.string   "name"
    t.string   "goods_cate_path"
    t.string   "cate_type"
    t.integer  "parent_goods_cate_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "no"
    t.string   "icon"
    t.integer  "goods_cate_id"
    t.integer  "goods_type_id"
    t.integer  "brand_id"
    t.integer  "vendor_id"
    t.text     "brief"
    t.text     "intro"
    t.string   "unit"
    t.string   "keywords"
    t.boolean  "sellable",                               default: true
    t.decimal  "mk_price",      precision: 20, scale: 2, default: 0.0
    t.decimal  "price",         precision: 20, scale: 2, default: 0.0
    t.string   "weight"
    t.integer  "point",                                  default: 0
    t.integer  "store",                                  default: 0
    t.text     "params_desc"
    t.text     "pdt_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "good_id"
  end

  create_table "shopping_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "shopping_id"
    t.string   "no"
    t.string   "name"
    t.integer  "quantity"
    t.integer  "point"
    t.decimal  "price",       precision: 20, scale: 2, default: 0.0
    t.decimal  "amount",      precision: 20, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppings", force: true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.string   "status"
    t.string   "pay_status"
    t.string   "ship_status"
    t.string   "ship"
    t.string   "payment"
    t.integer  "item_num"
    t.string   "customer_name"
    t.string   "customer_address"
    t.string   "mobile"
    t.string   "zipcode"
    t.string   "ship_time"
    t.decimal  "cost_item",        precision: 20, scale: 2, default: 0.0
    t.decimal  "cost_ship",        precision: 20, scale: 2, default: 0.0
    t.decimal  "amount",           precision: 20, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.string   "manager_name"
    t.string   "address"
    t.text     "desc"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
