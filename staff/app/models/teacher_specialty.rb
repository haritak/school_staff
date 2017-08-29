class TeacherSpecialty < ApplicationRecord
  belongs_to :teacher
  belongs_to :specialty
end
