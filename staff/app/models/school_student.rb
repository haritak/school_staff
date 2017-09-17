class SchoolStudent < ApplicationRecord
  belongs_to :school
  belongs_to :student
  belongs_to :schoolyear
end
