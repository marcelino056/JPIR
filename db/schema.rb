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

ActiveRecord::Schema.define(version: 2019_02_12_012259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_points", force: :cascade do |t|
    t.string "ip_address"
    t.string "mac_address"
    t.string "user"
    t.string "password"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinates", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data", force: :cascade do |t|
    t.bigint "mobile_id"
    t.string "type"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile_id"], name: "index_data_on_mobile_id"
  end

  create_table "limite_zones", force: :cascade do |t|
    t.bigint "zones_id"
    t.bigint "coordinate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinate_id"], name: "index_limite_zones_on_coordinate_id"
    t.index ["zones_id"], name: "index_limite_zones_on_zones_id"
  end

  create_table "location_devices", force: :cascade do |t|
    t.bigint "access_point_id"
    t.bigint "coordinate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_point_id"], name: "index_location_devices_on_access_point_id"
    t.index ["coordinate_id"], name: "index_location_devices_on_coordinate_id"
  end

  create_table "mobiles", force: :cascade do |t|
    t.string "modelo"
    t.string "mac_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permises", force: :cascade do |t|
    t.string "object"
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permises_roles", force: :cascade do |t|
    t.bigint "permises_id"
    t.bigint "roles_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permises_id"], name: "index_permises_roles_on_permises_id"
    t.index ["roles_id"], name: "index_permises_roles_on_roles_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zone__devices", force: :cascade do |t|
    t.bigint "access_point_id"
    t.bigint "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_point_id"], name: "index_zone__devices_on_access_point_id"
    t.index ["zone_id"], name: "index_zone__devices_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "data", "mobiles"
  add_foreign_key "limite_zones", "coordinates"
  add_foreign_key "limite_zones", "zones", column: "zones_id"
  add_foreign_key "location_devices", "access_points"
  add_foreign_key "location_devices", "coordinates"
  add_foreign_key "permises_roles", "permises", column: "permises_id"
  add_foreign_key "permises_roles", "roles", column: "roles_id"
  add_foreign_key "zone__devices", "access_points"
  add_foreign_key "zone__devices", "zones"
end
