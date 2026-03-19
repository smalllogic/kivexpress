# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_03_18_091101) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "country"
    t.string "province"
    t.string "city"
    t.string "district"
    t.text "detail_address"
    t.string "contact_name"
    t.string "phone"
    t.string "alt_phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "weight"
    t.decimal "volume"
    t.decimal "length"
    t.decimal "width"
    t.decimal "height"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sender_name"
    t.string "sender_phone"
    t.string "sender_alt_phone"
    t.string "sender_email"
    t.string "sender_country"
    t.string "sender_province"
    t.string "sender_city"
    t.string "sender_district"
    t.text "sender_detail_address"
    t.string "receiver_name"
    t.string "receiver_phone"
    t.string "receiver_alt_phone"
    t.string "receiver_email"
    t.string "receiver_country"
    t.string "receiver_province"
    t.string "receiver_city"
    t.string "receiver_district"
    t.text "receiver_detail_address"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "tracking_updates", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "status_description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_tracking_updates_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "tracking_updates", "orders"
end
