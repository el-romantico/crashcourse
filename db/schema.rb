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

ActiveRecord::Schema.define(version: 20140426221952) do

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.boolean  "approved",         default: false
    t.integer  "lecturer_id"
    t.decimal  "min_participants"
    t.integer  "location_id"
  end

  add_index "courses", ["location_id"], name: "index_courses_on_location_id"

  create_table "courses_tags", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "tag_id"
  end

  create_table "courses_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  create_table "locations", force: true do |t|
    t.integer "course_id"
    t.string  "address"
    t.float   "lat"
    t.float   "lng"
  end

  add_index "locations", ["course_id"], name: "index_locations_on_course_id"

  create_table "requests", force: true do |t|
    t.string   "location"
    t.integer  "tag_id"
    t.integer  "requester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests_tags", id: false, force: true do |t|
    t.integer "request_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string "label"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.string   "picture"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
