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

ActiveRecord::Schema.define(version: 20170407141708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "couchposts", force: :cascade do |t|
    t.string   "location",                    null: false
    t.datetime "date_needed",                 null: false
    t.boolean  "couch_found", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "profile_id",                  null: false
    t.index ["profile_id"], name: "index_couchposts_on_profile_id", using: :btree
  end

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "profile_id", null: false
    t.integer  "friend_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
    t.index ["profile_id"], name: "index_friendships_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "given_name"
    t.string   "surname"
    t.string   "gender"
    t.datetime "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "couchposts", "profiles"
  add_foreign_key "examples", "users"
  add_foreign_key "profiles", "users"
end
