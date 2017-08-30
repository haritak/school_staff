class SchoolCourseTeacher < ApplicationRecord
  belongs_to :school_course
  belongs_to :teacher
end
