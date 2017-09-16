class SchoolClassStudent < ApplicationRecord
  belongs_to :school_student
  belongs_to :school_class
end
