class SchoolCourse < ApplicationRecord
  belongs_to :school_class
  belongs_to :lesson

  has_many :school_course_teachers

end
