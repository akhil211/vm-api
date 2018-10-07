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

ActiveRecord::Schema.define(version: 20181005204758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.bigint "school_id"
    t.string "name"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_albums_on_school_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "data_file_name"
    t.string "data_content_type"
    t.bigint "data_file_size"
    t.datetime "data_updated_at"
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
  end

  create_table "exam_groups", force: :cascade do |t|
    t.bigint "standard_id"
    t.string "title"
    t.string "color_code"
    t.boolean "is_result_published", default: false
    t.integer "display_type", limit: 2, default: 0
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["standard_id"], name: "index_exam_groups_on_standard_id"
  end

  create_table "exam_results", force: :cascade do |t|
    t.bigint "exam_id"
    t.integer "student_id"
    t.decimal "marks_obtained"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_results_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "exam_group_id"
    t.bigint "subject_id"
    t.string "subject_code"
    t.decimal "maximum_marks"
    t.decimal "passing_marks"
    t.string "passing_grade"
    t.datetime "date"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_group_id"], name: "index_exams_on_exam_group_id"
    t.index ["subject_id"], name: "index_exams_on_subject_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.bigint "subject_id"
    t.text "description"
    t.date "date"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_homeworks_on_subject_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "board"
    t.string "contact_no"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "admin_id"
    t.date "absent_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_staff_attendances_on_admin_id"
    t.index ["user_id"], name: "index_staff_attendances_on_user_id"
  end

  create_table "standards", force: :cascade do |t|
    t.bigint "school_id"
    t.integer "teacher_id"
    t.string "title"
    t.string "section"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_standards_on_school_id"
    t.index ["teacher_id"], name: "index_standards_on_teacher_id"
  end

  create_table "student_attendances", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.date "absent_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_attendances_on_student_id"
  end

  create_table "student_details", force: :cascade do |t|
    t.bigint "standard_id"
    t.integer "student_id"
    t.string "role_no"
    t.string "admission_no"
    t.date "admission_date"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["standard_id"], name: "index_student_details_on_standard_id"
    t.index ["student_id"], name: "index_student_details_on_student_id"
  end

  create_table "student_previous_details", force: :cascade do |t|
    t.bigint "student_id"
    t.string "school"
    t.string "board"
    t.string "year"
    t.string "standard"
    t.string "reason_of_leaving"
    t.text "school_address"
    t.decimal "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_previous_details_on_student_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "standard_id"
    t.integer "teacher_id"
    t.string "title"
    t.string "color_code"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["standard_id"], name: "index_subjects_on_standard_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "school_id"
    t.integer "guardian_id"
    t.integer "role"
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
    t.date "joining_date"
    t.date "dob"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "otp_send_at"
    t.index ["school_id"], name: "index_users_on_school_id"
  end

end
