class Lesson < ApplicationRecord
  belongs_to :lesson_type
  belongs_to :school_grade_specialty

  def combined_name
    "#{school_grade_specialty.code} - #{description} - #{hours}#{lesson_type.code}"
  end
end
