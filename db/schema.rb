# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_14_135805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.datetime "start_date"
    t.integer "number_of_people"
    t.bigint "journey_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journey_id"], name: "index_bookings_on_journey_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.text "address"
    t.integer "duration"
    t.integer "price"
    t.boolean "exterior"
    t.string "interest"
    t.string "sense"
    t.integer "popularity"
    t.text "anecdote"
    t.string "environment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.integer "age"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "journeys"
  add_foreign_key "bookings", "users"
  add_foreign_key "journeys", "users"
end
