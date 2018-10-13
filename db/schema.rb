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

ActiveRecord::Schema.define(version: 20181013135054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "address_line_1", limit: 200
    t.text "address_line_2"
    t.string "landmark", limit: 200
    t.string "pincode", limit: 10
    t.string "city", limit: 100
    t.string "state", limit: 100
    t.integer "address_type", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "albums", force: :cascade do |t|
    t.bigint "school_id"
    t.string "name", limit: 100
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_albums_on_school_id"
  end

  create_table "alerts", force: :cascade do |t|
    t.bigint "user_id"
    t.text "message"
    t.boolean "is_read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
    t.string "title", limit: 200
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.integer "status", limit: 2, default: 1
    t.integer "file_type", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
  end

  create_table "bulletin_boards", force: :cascade do |t|
    t.bigint "school_id"
    t.bigint "admin_id"
    t.string "title", limit: 200
    t.text "body"
    t.boolean "sticky", default: true
    t.integer "status", limit: 2, default: 1
    t.text "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_bulletin_boards_on_admin_id"
    t.index ["school_id"], name: "index_bulletin_boards_on_school_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "school_id"
    t.bigint "admin_id"
    t.string "title", limit: 200
    t.text "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_events_on_admin_id"
    t.index ["school_id"], name: "index_events_on_school_id"
  end

  create_table "exam_groups", force: :cascade do |t|
    t.bigint "standard_id"
    t.string "title", limit: 100
    t.string "color_code", limit: 10
    t.integer "display_type", limit: 2, default: 0
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["standard_id"], name: "index_exam_groups_on_standard_id"
  end

  create_table "exam_results", force: :cascade do |t|
    t.bigint "exam_id"
    t.integer "student_id"
    t.decimal "marks_obtained", precision: 4, scale: 1
    t.string "grade", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_results_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "exam_group_id"
    t.bigint "subject_id"
    t.string "subject_code", limit: 20
    t.decimal "maximum_marks", precision: 4, scale: 1
    t.decimal "passing_marks", precision: 4, scale: 1
    t.datetime "date"
    t.boolean "is_result_published", default: false
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
    t.string "name", limit: 250
    t.string "board", limit: 50
    t.string "landline_no_1", limit: 20
    t.string "landline_no_2", limit: 20
    t.string "fax", limit: 100
    t.string "website", limit: 200
    t.string "email_id", limit: 100
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_attendances", force: :cascade do |t|
    t.bigint "teacher_id"
    t.integer "admin_id"
    t.date "absent_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_staff_attendances_on_admin_id"
    t.index ["teacher_id"], name: "index_staff_attendances_on_teacher_id"
  end

  create_table "standards", force: :cascade do |t|
    t.bigint "school_id"
    t.integer "teacher_id"
    t.string "title", limit: 100
    t.string "section", limit: 20
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
    t.string "roll_no", limit: 50
    t.string "admission_no", limit: 100
    t.date "admission_date"
    t.string "category", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["standard_id"], name: "index_student_details_on_standard_id"
    t.index ["student_id"], name: "index_student_details_on_student_id"
  end

  create_table "student_previous_details", force: :cascade do |t|
    t.bigint "student_id"
    t.string "school", limit: 100
    t.string "board", limit: 50
    t.integer "year"
    t.string "standard", limit: 20
    t.string "reason_of_leaving", limit: 200
    t.text "school_address"
    t.decimal "percentage", precision: 4, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_previous_details_on_student_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "standard_id"
    t.integer "teacher_id"
    t.string "title", limit: 100
    t.string "color_code", limit: 10
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
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.string "email", limit: 100
    t.string "username", limit: 50
    t.string "password_digest"
    t.string "contact_no", limit: 20
    t.integer "otp"
    t.string "alternate_contact_no", limit: 20
    t.string "occupation", limit: 100
    t.string "qualification", limit: 100
    t.string "gender", limit: 10
    t.string "spouse_name", limit: 100
    t.date "joining_date"
    t.date "dob"
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "otp_send_at"
    t.index ["school_id"], name: "index_users_on_school_id"
  end

end
