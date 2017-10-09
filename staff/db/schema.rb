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

ActiveRecord::Schema.define(version: 20171009135755) do

  create_table "lesson_assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "lesson_id"
    t.bigint "specialty_id"
    t.integer "priority"
    t.text "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "specialty_id", "priority"], name: "uniqness_of_lesson_assignments", unique: true
    t.index ["lesson_id"], name: "index_lesson_assignments_on_lesson_id"
    t.index ["specialty_id"], name: "index_lesson_assignments_on_specialty_id"
  end

  create_table "lesson_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_lesson_types_on_code", unique: true
  end

  create_table "lessons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "abbr"
    t.string "description"
    t.integer "hours"
    t.bigint "lesson_type_id"
    t.bigint "school_grade_specialty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference"
    t.boolean "deprecated", default: false
    t.string "deprecated_reference"
    t.index ["abbr"], name: "index_lessons_on_abbr", unique: true
    t.index ["lesson_type_id"], name: "index_lessons_on_lesson_type_id"
    t.index ["school_grade_specialty_id"], name: "index_lessons_on_school_grade_specialty_id"
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "father_name", default: "", null: false
    t.string "mother_name", default: "", null: false
    t.string "notification_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile_phone"
    t.string "home_address"
    t.string "first_name_gen"
    t.string "first_name_ait"
    t.string "father_name_gen"
    t.string "father_name_ait"
    t.string "mother_name_gen"
    t.string "mother_name_ait"
    t.string "last_name_gen"
    t.string "last_name_ait"
    t.index ["first_name", "last_name", "father_name", "mother_name"], name: "uniqness_in_people", unique: true
  end

  create_table "request_specifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "description"
    t.text "spec_reference"
    t.bigint "teacher_working_class_id"
    t.string "template_filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_working_class_id"], name: "index_request_specifications_on_teacher_working_class_id"
  end

  create_table "response_specifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "request_specification_id"
    t.string "template_filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_specification_id"], name: "index_response_specifications_on_request_specification_id"
  end

  create_table "saved_school_course_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "saved_school_course_id"
    t.bigint "school_teacher_id"
    t.integer "save_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saved_school_course_id"], name: "index_saved_school_course_teachers_on_saved_school_course_id"
    t.index ["school_teacher_id"], name: "index_saved_school_course_teachers_on_school_teacher_id"
  end

  create_table "saved_school_courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "school_class_id"
    t.bigint "lesson_id"
    t.integer "duration"
    t.integer "save_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_saved_school_courses_on_lesson_id"
    t.index ["school_class_id"], name: "index_saved_school_courses_on_school_class_id"
  end

  create_table "schedule_snapshots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "save_no"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_class_lessons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "school_class_id"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_school_class_lessons_on_lesson_id"
    t.index ["school_class_id"], name: "index_school_class_lessons_on_school_class_id"
  end

  create_table "school_class_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "school_student_id"
    t.bigint "school_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_school_class_students_on_school_class_id"
    t.index ["school_student_id", "school_class_id"], name: "uniqness_in_school_class_registrations", unique: true
    t.index ["school_student_id"], name: "index_school_class_students_on_school_student_id"
  end

  create_table "school_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "schoolyear_id"
    t.bigint "school_id"
    t.bigint "school_grade_specialty_id"
    t.integer "number"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deprecated", default: false
    t.string "deprecated_reference"
    t.index ["school_grade_specialty_id"], name: "index_school_classes_on_school_grade_specialty_id"
    t.index ["school_id"], name: "index_school_classes_on_school_id"
    t.index ["schoolyear_id", "school_id", "school_grade_specialty_id", "number"], name: "uniqeness in school_classes", unique: true
    t.index ["schoolyear_id"], name: "index_school_classes_on_schoolyear_id"
  end

  create_table "school_course_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "school_course_id"
    t.bigint "school_teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_course_id"], name: "index_school_course_teachers_on_school_course_id"
    t.index ["school_teacher_id"], name: "index_school_course_teachers_on_school_teacher_id"
  end

  create_table "school_courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "school_class_id"
    t.bigint "lesson_id"
    t.integer "duration", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_school_courses_on_lesson_id"
    t.index ["school_class_id"], name: "index_school_courses_on_school_class_id"
  end

  create_table "school_grade_specialties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "description"
    t.bigint "school_grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "required_hours"
    t.boolean "deprecated", default: false
    t.string "deprecated_reference"
    t.index ["code"], name: "index_school_grade_specialties_on_code", unique: true
    t.index ["school_grade_id"], name: "index_school_grade_specialties_on_school_grade_id"
  end

  create_table "school_grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_school_grades_on_code", unique: true
  end

  create_table "school_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "school_id"
    t.bigint "student_id"
    t.integer "registry_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "schoolyear_id"
    t.string "username"
    t.string "password"
    t.index ["school_id"], name: "index_school_students_on_school_id"
    t.index ["schoolyear_id"], name: "index_school_students_on_schoolyear_id"
    t.index ["student_id"], name: "index_school_students_on_student_id"
    t.index ["student_id"], name: "uniqness_in_school_registrations", unique: true
  end

  create_table "school_teacher_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "school_teacher_id"
    t.bigint "request_specification_id"
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "starting_date"
    t.integer "duration"
    t.index ["request_specification_id"], name: "index_school_teacher_requests_on_request_specification_id"
    t.index ["school_teacher_id"], name: "index_school_teacher_requests_on_school_teacher_id"
  end

  create_table "school_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "teacher_id"
    t.bigint "school_id"
    t.integer "disposal_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_teachers_on_school_id"
    t.index ["teacher_id", "school_id"], name: "school_teachers_uniqness", unique: true
    t.index ["teacher_id"], name: "index_school_teachers_on_teacher_id"
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_schools_on_code", unique: true
    t.index ["email"], name: "index_schools_on_email", unique: true
  end

  create_table "schoolyears", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "startingyear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["startingyear"], name: "index_schoolyears_on_startingyear", unique: true
  end

  create_table "specialties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_specialties_on_code", unique: true
  end

  create_table "student_contact_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "student_id"
    t.text "info"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_contact_infos_on_student_id"
  end

  create_table "student_photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "student_id"
    t.string "filename"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_photos_on_student_id"
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "father_name", default: "", null: false
    t.string "mother_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "serial_no"
    t.index ["first_name", "last_name", "father_name", "mother_name"], name: "uniqness_in_students", unique: true
  end

  create_table "teacher_specialties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "teacher_id"
    t.bigint "specialty_id"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty_id"], name: "index_teacher_specialties_on_specialty_id"
    t.index ["teacher_id", "specialty_id"], name: "uniqness_in_teacher_specialties", unique: true
    t.index ["teacher_id"], name: "index_teacher_specialties_on_teacher_id"
  end

  create_table "teacher_working_classes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code", default: "", null: false
    t.index ["code"], name: "index_teacher_working_classes_on_code", unique: true
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id"
    t.bigint "school_id"
    t.date "date_in_school"
    t.date "date_employed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teaching_hours"
    t.bigint "teacher_working_class_id"
    t.index ["person_id"], name: "index_teachers_on_person_id", unique: true
    t.index ["school_id"], name: "index_teachers_on_school_id"
    t.index ["teacher_working_class_id"], name: "index_teachers_on_teacher_working_class_id"
  end

  add_foreign_key "lesson_assignments", "lessons"
  add_foreign_key "lesson_assignments", "specialties"
  add_foreign_key "request_specifications", "teacher_working_classes"
  add_foreign_key "response_specifications", "request_specifications"
  add_foreign_key "saved_school_course_teachers", "saved_school_courses"
  add_foreign_key "saved_school_course_teachers", "school_teachers"
  add_foreign_key "saved_school_courses", "lessons"
  add_foreign_key "saved_school_courses", "school_classes"
  add_foreign_key "school_class_lessons", "lessons"
  add_foreign_key "school_class_lessons", "school_classes"
  add_foreign_key "school_class_students", "school_classes"
  add_foreign_key "school_class_students", "school_students"
  add_foreign_key "school_classes", "school_grade_specialties"
  add_foreign_key "school_classes", "schools"
  add_foreign_key "school_classes", "schoolyears"
  add_foreign_key "school_course_teachers", "school_courses"
  add_foreign_key "school_course_teachers", "school_teachers"
  add_foreign_key "school_courses", "lessons"
  add_foreign_key "school_courses", "school_classes"
  add_foreign_key "school_grade_specialties", "school_grades"
  add_foreign_key "school_students", "schools"
  add_foreign_key "school_students", "schoolyears"
  add_foreign_key "school_students", "students"
  add_foreign_key "school_teacher_requests", "request_specifications"
  add_foreign_key "school_teacher_requests", "school_teachers"
  add_foreign_key "school_teachers", "schools"
  add_foreign_key "school_teachers", "teachers"
  add_foreign_key "student_contact_infos", "students"
  add_foreign_key "student_photos", "students"
  add_foreign_key "teacher_specialties", "specialties"
  add_foreign_key "teacher_specialties", "teachers"
  add_foreign_key "teachers", "people"
  add_foreign_key "teachers", "schools"
  add_foreign_key "teachers", "teacher_working_classes"
end
