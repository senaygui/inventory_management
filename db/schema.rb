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

ActiveRecord::Schema.define(version: 2018_10_07_004513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "middle_name", default: "", null: false
    t.string "role", default: "", null: false
    t.string "department"
    t.string "job_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "material_requestions", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.string "product_name", default: "", null: false
    t.integer "quantity", null: false
    t.string "reason_of_request", default: "", null: false
    t.string "general_manager_approval_status", default: "Pending"
    t.string "store_manager_request_status"
    t.string "gm_acceptance_condition"
    t.string "sm_denied_reason"
    t.string "gm_denied_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_material_requestions_on_admin_user_id"
  end

  create_table "purchase_requests", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.string "product_name", default: "", null: false
    t.decimal "quantity", null: false
    t.string "measurment", default: "", null: false
    t.text "product_description", default: "", null: false
    t.string "purchaser_approval"
    t.text "denied_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_purchase_requests_on_admin_user_id"
  end

  create_table "return_requests", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.string "product_name", default: "", null: false
    t.decimal "quantity", null: false
    t.text "product_description", default: "", null: false
    t.string "reference", default: "", null: false
    t.string "sm_confirmation", default: "Pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_return_requests_on_admin_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.string "product_name", default: "", null: false
    t.integer "quantity", null: false
    t.decimal "unit_price", null: false
    t.decimal "total_price", null: false
    t.string "measurment", default: "", null: false
    t.decimal "part_number", null: false
    t.string "reference", default: "", null: false
    t.text "product_description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_stocks_on_admin_user_id"
  end

  add_foreign_key "material_requestions", "admin_users"
  add_foreign_key "purchase_requests", "admin_users"
  add_foreign_key "return_requests", "admin_users"
  add_foreign_key "stocks", "admin_users"
end
