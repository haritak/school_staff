class Lesson < ApplicationRecord
  belongs_to :lesson_type
  belongs_to :school_grade_specialty

  def short_name
    "#{description}-#{lesson_type.code}"
  end
  def full_name
    "#{description} - #{hours}#{lesson_type.code}"
  end
  def combined_name
    "#{school_grade_specialty.code} - #{full_name}"
  end

  def to_s
    combined_name
  end
end
