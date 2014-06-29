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

ActiveRecord::Schema.define(version: 20140629113947) do

  create_table "admins", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "super_admin"
  end

  create_table "difficulties", force: true do |t|
    t.string "grade"
  end

  create_table "fixtures", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "result_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "new_athletes", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rec_run_routes", force: true do |t|
    t.string   "name"
    t.integer  "distance"
    t.text     "description"
    t.text     "google_maps_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "difficulty"
  end

  create_table "socials", force: true do |t|
    t.string   "name"
    t.string   "facebook_event_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
  end

end
