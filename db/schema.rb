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

ActiveRecord::Schema.define(version: 2019_01_29_170941) do

  create_table "guests", force: :cascade do |t|
    t.string "name", default: ""
    t.string "email", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_shifts", force: :cascade do |t|
    t.string "shift_type", default: ""
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_shifts_on_restaurant_id"
  end

  create_table "restaurant_tables", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "name", default: ""
    t.integer "min_guest", default: 0
    t.integer "max_guest", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_tables_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", default: ""
    t.string "email", default: ""
    t.string "phone", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
