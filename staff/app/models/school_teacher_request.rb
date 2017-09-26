class SchoolTeacherRequest < ApplicationRecord
  belongs_to :school_teacher
  belongs_to :request_specification
end
