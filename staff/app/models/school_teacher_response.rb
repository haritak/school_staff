class SchoolTeacherResponse < ApplicationRecord
  belongs_to :school_teacher_request
  has_one :decision_file
end
