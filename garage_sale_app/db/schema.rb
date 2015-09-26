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

ActiveRecord::Schema.define(version: 20150925225203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.decimal  "star_rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "garage_date_times", force: :cascade do |t|
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "garage_sale_id"
  end

  add_index "garage_date_times", ["garage_sale_id"], name: "index_garage_date_times_on_garage_sale_id", using: :btree

  create_table "garage_sales", force: :cascade do |t|
    t.string   "address"
    t.string   "description"
    t.datetime "postdate"
    t.text     "title"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "full_address"
    t.decimal  "star_rating"
    t.integer  "num_ratings"
    t.integer  "phone_number",       limit: 8
    t.string   "email"
    t.boolean  "can_text"
    t.boolean  "can_call"
    t.boolean  "can_email"
  end

  add_index "garage_sales", ["user_id"], name: "index_garage_sales_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.text     "description"
    t.decimal  "price"
    t.text     "images",         default: [],              array: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "garage_sale_id"
  end

  add_index "items", ["garage_sale_id"], name: "index_items_on_garage_sale_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "garage_sale_id"
  end

  add_index "pictures", ["garage_sale_id"], name: "index_pictures_on_garage_sale_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "email"
  end

  add_foreign_key "garage_date_times", "garage_sales"
  add_foreign_key "garage_sales", "users"
  add_foreign_key "items", "garage_sales"
  add_foreign_key "pictures", "garage_sales"
end
