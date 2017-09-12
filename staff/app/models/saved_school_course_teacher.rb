class SavedSchoolCourseTeacher < ApplicationRecord
  belongs_to :saved_school_course
  belongs_to :school_teacher

  def to_s
    school_teacher.teacher.to_s
  end
end
