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

ActiveRecord::Schema.define(version: 20131211165246) do

  create_table "booking_extras", force: true do |t|
    t.string   "extras"
    t.integer  "vehicle_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: true do |t|
    t.integer  "user_id"
    t.string   "pickup_address"
    t.string   "dropoff_address"
    t.string   "via_address"
    t.integer  "number_of_bags",         default: 0, null: false
    t.integer  "number_of_passengers",   default: 0, null: false
    t.integer  "booked_hours"
    t.string   "flight_info"
    t.integer  "recurrent_type",         default: 1, null: false
    t.datetime "pickup_datetime"
    t.datetime "return_pickup_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "pickup_time"
    t.datetime "return_pickup_time"
    t.string   "passenger_name"
    t.string   "passenger_phone_no"
    t.string   "passenger_email"
    t.time     "dropoff_time"
    t.integer  "taxi_info_id"
  end

  create_table "dropoff_addresses", force: true do |t|
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "booking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickup_addresses", force: true do |t|
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "booking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texi_infos", force: true do |t|
    t.string   "texi_no"
    t.string   "driver_name"
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "taxi_company_name"
    t.string   "taxi_company_phone_no"
    t.integer  "vehicle_type_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "country",                default: "", null: false
    t.string   "phone_no",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "update_password_date"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_preferences", force: true do |t|
    t.integer  "booking_id"
    t.integer  "vehicle_type_id"
    t.integer  "number_of_vehicle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_types", force: true do |t|
    t.string   "vehicle_type"
    t.float    "vehicle_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
