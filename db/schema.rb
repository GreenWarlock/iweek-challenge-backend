# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_25_145420) do

  create_table "business_photos", force: :cascade do |t|
    t.integer "business_id", null: false
    t.string "photo_url"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_business_photos_on_business_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.integer "category_id", null: false
    t.string "information"
    t.string "latitude"
    t.string "longitude"
    t.boolean "cm_certification"
    t.float "ratings"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_businesses_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "second_last_name"
    t.string "email"
    t.string "phone_number"
    t.string "photo"
    t.integer "level"
    t.integer "exp"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "business_photos", "businesses"
  add_foreign_key "businesses", "categories"
end
