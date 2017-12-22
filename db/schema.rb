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

ActiveRecord::Schema.define(version: 20171222112043) do

  create_table "availabilities", force: :cascade do |t|
    t.integer "user_id"
    t.string "date"
    t.string "time_slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "circonscription"
    t.string "phone_number"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_centers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_centers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_centers_on_reset_password_token", unique: true
  end

  create_table "circonscriptions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diplomas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diplomas_offers", id: false, force: :cascade do |t|
    t.integer "diploma_id", null: false
    t.integer "offer_id", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "date"
    t.string "time_slot"
    t.integer "offer_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "center_id"
    t.integer "school_id"
    t.index ["center_id"], name: "index_offers_on_center_id"
    t.index ["school_id"], name: "index_offers_on_school_id"
  end

  create_table "offers_slots", id: false, force: :cascade do |t|
    t.integer "slot_id", null: false
    t.integer "offer_id", null: false
  end

  create_table "rhagents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "circonscription"
    t.index ["email"], name: "index_rhagents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_rhagents_on_reset_password_token", unique: true
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "circonscription"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "center_id"
    t.index ["center_id"], name: "index_schools_on_center_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "soi_number"
    t.string "circonscription"
    t.string "school"
    t.string "first_name"
    t.string "last_name"
    t.datetime "birthday"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "diploma"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "approved", default: false, null: false
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
