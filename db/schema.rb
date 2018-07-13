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

ActiveRecord::Schema.define(version: 2018_07_13_214416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.string "password_digest", null: false
    t.string "institution", null: false
    t.integer "cut_off", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_classrooms_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "description", null: false
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_exams_on_classroom_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "number", null: false
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_groups_on_exam_id"
  end

  create_table "user_has_classrooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "classroom_id"
    t.bigint "user_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_user_has_classrooms_on_classroom_id"
    t.index ["user_id"], name: "index_user_has_classrooms_on_user_id"
    t.index ["user_type_id"], name: "index_user_has_classrooms_on_user_type_id"
  end

  create_table "user_has_exams", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_user_has_exams_on_exam_id"
    t.index ["user_id"], name: "index_user_has_exams_on_user_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "is_from_facebook", default: false
    t.string "telephone_ddi", null: false
    t.string "telephone_ddd", null: false
    t.string "telephone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "classrooms", "users"
  add_foreign_key "exams", "classrooms"
  add_foreign_key "groups", "exams"
  add_foreign_key "user_has_classrooms", "classrooms"
  add_foreign_key "user_has_classrooms", "user_types"
  add_foreign_key "user_has_classrooms", "users"
  add_foreign_key "user_has_exams", "exams"
  add_foreign_key "user_has_exams", "users"
end
