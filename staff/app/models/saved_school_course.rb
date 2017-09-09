class SavedSchoolCourse < ApplicationRecord
  belongs_to :school_class
  belongs_to :lesson

  has_many :saved_school_course_teachers
end
