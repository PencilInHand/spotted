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

ActiveRecord::Schema.define(version: 20150414204648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "modifications", force: :cascade do |t|
    t.string   "type"
    t.string   "manufacturer"
    t.string   "image_uri"
    t.string   "caption"
    t.string   "section"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "vehicle_id"
  end

  add_index "modifications", ["vehicle_id"], name: "index_modifications_on_vehicle_id", using: :btree

  create_table "time_cards", force: :cascade do |t|
    t.time     "reaction_time"
    t.time     "sixty_foot_time"
    t.time     "three_thirty_foot_time"
    t.time     "eighth_mile_time"
    t.string   "eighth_mile_speed"
    t.time     "thousand_foot_time"
    t.time     "fourth_mile_time"
    t.string   "fourth_mile_speed"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "vehicle_id"
  end

  add_index "time_cards", ["vehicle_id"], name: "index_time_cards_on_vehicle_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.string   "vin"
    t.date     "year"
    t.string   "make"
    t.string   "model"
    t.string   "sub_model"
  end

  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

  add_foreign_key "vehicles", "users"
end
