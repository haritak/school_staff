class SchoolStudent < ApplicationRecord
  belongs_to :school
  belongs_to :student
  belongs_to :schoolyear

  has_many :school_class_students

  def to_s
    student.to_s
  end
end
