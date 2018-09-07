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

ActiveRecord::Schema.define(version: 20180828174327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "homeworks", force: :cascade do |t|
    t.bigint "subject_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_homeworks_on_subject_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "board"
    t.string "contact_no"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standards", force: :cascade do |t|
    t.bigint "school_id"
    t.integer "teacher_id"
    t.string "title"
    t.string "section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_standards_on_school_id"
    t.index ["teacher_id"], name: "index_standards_on_teacher_id"
  end

  create_table "student_attendances", force: :cascade do |t|
    t.bigint "student_id"
    t.integer "teacher_id"
    t.date "absent_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_attendances_on_student_id"
    t.index ["teacher_id"], name: "index_student_attendances_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "school_id"
    t.bigint "standard_id"
    t.integer "parent_id"
    t.string "first_name"
    t.string "last_name"
    t.string "role_no"
    t.string "admission_no"
    t.date "admisssion_date"
    t.string "category"
    t.date "dob"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_students_on_parent_id"
    t.index ["school_id"], name: "index_students_on_school_id"
    t.index ["standard_id"], name: "index_students_on_standard_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "standard_id"
    t.integer "teacher_id"
    t.string "title"
    t.string "color_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["standard_id"], name: "index_subjects_on_standard_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "school_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "contact_no"
    t.integer "otp"
    t.string "alternate_contact_no"
    t.text "home_address"
    t.text "office_address"
    t.string "occupation"
    t.string "qualification"
    t.string "gender"
    t.string "spouse_name"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "otp_send_at"
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["school_id"], name: "index_users_on_school_id"
  end

end
