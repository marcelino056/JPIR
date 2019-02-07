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

ActiveRecord::Schema.define(version: 2019_01_29_172009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.inet "ip_address"
    t.string "mac_address"
    t.string "user"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "devise_positions", force: :cascade do |t|
    t.bigint "device_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["device_id"], name: "index_devise_positions_on_device_id"
    t.index ["location_id"], name: "index_devise_positions_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "lat"
    t.float "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mobile_ips", force: :cascade do |t|
    t.bigint "mobile_id"
    t.inet "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile_id"], name: "index_mobile_ips_on_mobile_id"
  end

  create_table "mobile_locations", force: :cascade do |t|
    t.bigint "mobile_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_mobile_locations_on_location_id"
    t.index ["mobile_id"], name: "index_mobile_locations_on_mobile_id"
  end

  create_table "mobiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "model"
    t.string "brand"
    t.string "mac_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["user_id"], name: "index_mobiles_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "object"
    t.string "method"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "zone_limits", force: :cascade do |t|
    t.bigint "zone_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_zone_limits_on_location_id"
    t.index ["zone_id"], name: "index_zone_limits_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  add_foreign_key "devise_positions", "devices"
  add_foreign_key "devise_positions", "locations"
  add_foreign_key "mobile_ips", "mobiles"
  add_foreign_key "mobile_locations", "locations"
  add_foreign_key "mobile_locations", "mobiles"
  add_foreign_key "mobiles", "users"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "zone_limits", "locations"
  add_foreign_key "zone_limits", "zones"
end
