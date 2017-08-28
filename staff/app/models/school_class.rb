class SchoolClass < ApplicationRecord
  belongs_to :schoolyear
  belongs_to :school
  belongs_to :school_grade_specialty
end
