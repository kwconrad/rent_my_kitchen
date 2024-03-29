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

ActiveRecord::Schema.define(version: 20170523165405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "font_awesome_icon"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "kitchen_id"
    t.integer  "booker_id"
    t.integer  "guests_count"
    t.string   "status",       default: "unconfirmed"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["booker_id"], name: "index_bookings_on_booker_id", using: :btree
    t.index ["kitchen_id"], name: "index_bookings_on_kitchen_id", using: :btree
  end

  create_table "kitchen_amenities", force: :cascade do |t|
    t.integer  "kitchen_id"
    t.integer  "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_kitchen_amenities_on_amenity_id", using: :btree
    t.index ["kitchen_id"], name: "index_kitchen_amenities_on_kitchen_id", using: :btree
  end

  create_table "kitchens", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "street_address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "capacity"
    t.integer  "price_per_hour"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "photo"
    t.index ["user_id"], name: "index_kitchens_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "kitchen_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "price_per_hour"
    t.index ["kitchen_id"], name: "index_listings_on_kitchen_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "comments"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "kitchen_id"
    t.index ["kitchen_id"], name: "index_reviews_on_kitchen_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "photo"
    t.string   "dob"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_user_accounts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "kitchens"
  add_foreign_key "kitchen_amenities", "amenities"
  add_foreign_key "kitchen_amenities", "kitchens"
  add_foreign_key "kitchens", "users"
  add_foreign_key "listings", "kitchens"
  add_foreign_key "reviews", "kitchens"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_accounts", "users"
end
