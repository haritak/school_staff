class Lesson < ApplicationRecord
  belongs_to :lesson_type
  belongs_to :school_grade_specialty
end
