class SavedSchoolCourseTeacher < ApplicationRecord
  belongs_to :saved_school_course
  belongs_to :school_teacher
end
