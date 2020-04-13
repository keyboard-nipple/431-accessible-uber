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

ActiveRecord::Schema.define(version: 2020_04_13_013957) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "certifications", force: :cascade do |t|
    t.string "name"
    t.boolean "approved"
    t.integer "driver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "disabilities"
    t.index ["driver_id"], name: "index_certifications_on_driver_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "dob"
    t.string "license"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "blind_accessibility"
    t.integer "karma", default: 0
  end

  create_table "riders", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "zip_code"
    t.string "uid"
    t.boolean "blind_accessibility"
    t.boolean "deaf"
    t.boolean "service_animal"
    t.boolean "wheelchair"
    t.string "emergency_contact"
    t.integer "karma", default: 0
    t.float "matching_ratio"
  end

  create_table "rides", force: :cascade do |t|
    t.text "origin"
    t.text "destination"
    t.integer "rider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "accepted", default: false
    t.boolean "completed", default: false
    t.datetime "timeAndDate"
    t.integer "driver_id"
    t.boolean "driver_completed"
    t.boolean "rider_completed"
    t.boolean "driver_rated", default: false
    t.boolean "rider_rated", default: false
    t.index ["driver_id"], name: "index_rides_on_driver_id"
    t.index ["rider_id"], name: "index_rides_on_rider_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "certifications", "drivers"
  add_foreign_key "rides", "drivers"
  add_foreign_key "rides", "riders"
end
