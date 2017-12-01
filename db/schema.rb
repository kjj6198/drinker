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

ActiveRecord::Schema.define(version: 20171201032957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drink_histories", force: :cascade do |t|
    t.integer  "user_id_id"
    t.integer  "drink_id_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "drink_id"
    t.index ["drink_id"], name: "index_drink_histories_on_drink_id", using: :btree
    t.index ["drink_id_id"], name: "index_drink_histories_on_drink_id_id", using: :btree
    t.index ["user_id"], name: "index_drink_histories_on_user_id", using: :btree
    t.index ["user_id_id"], name: "index_drink_histories_on_user_id_id", using: :btree
  end

  create_table "drink_shops", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "phone",      limit: 255, null: false
    t.text     "comment"
    t.string   "address",                null: false
    t.integer  "rank"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_url"
  end

  create_table "drinks", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "note"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "drink_shop_id"
    t.index ["drink_shop_id"], name: "index_drinks_on_drink_shop_id", using: :btree
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.datetime "end_time"
    t.boolean  "is_active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "drink_shop_id"
    t.integer  "user_id"
    t.index ["drink_shop_id"], name: "index_menus_on_drink_shop_id", using: :btree
    t.index ["user_id"], name: "index_menus_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.boolean  "has_paid"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "menu_id"
    t.integer  "drink_id"
    t.integer  "price",      null: false
    t.index ["drink_id"], name: "index_orders_on_drink_id", using: :btree
    t.index ["menu_id"], name: "index_orders_on_menu_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "picture"
    t.string   "username"
    t.boolean  "is_admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "drink_histories", "drinks"
  add_foreign_key "drink_histories", "users"
  add_foreign_key "drinks", "drink_shops"
  add_foreign_key "orders", "drinks"
  add_foreign_key "orders", "users"
end
