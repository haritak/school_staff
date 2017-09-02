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

ActiveRecord::Schema.define(version: 20170902061959) do

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
    t.string "notifcation_sms_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name", "father_name", "mother_name"], name: "uniqness_in_people", unique: true
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
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id"
    t.bigint "school_id"
    t.date "date_in_school"
    t.date "date_employed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teaching_hours"
    t.index ["person_id"], name: "index_teachers_on_person_id", unique: true
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  add_foreign_key "lesson_assignments", "lessons"
  add_foreign_key "lesson_assignments", "specialties"
  add_foreign_key "school_classes", "school_grade_specialties"
  add_foreign_key "school_classes", "schools"
  add_foreign_key "school_classes", "schoolyears"
  add_foreign_key "school_course_teachers", "school_courses"
  add_foreign_key "school_course_teachers", "school_teachers"
  add_foreign_key "school_courses", "lessons"
  add_foreign_key "school_courses", "school_classes"
  add_foreign_key "school_grade_specialties", "school_grades"
  add_foreign_key "school_teachers", "schools"
  add_foreign_key "school_teachers", "teachers"
  add_foreign_key "teacher_specialties", "specialties"
  add_foreign_key "teacher_specialties", "teachers"
  add_foreign_key "teachers", "people"
  add_foreign_key "teachers", "schools"
end
