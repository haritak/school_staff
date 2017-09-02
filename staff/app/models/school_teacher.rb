class SchoolTeacher < ApplicationRecord
  belongs_to :teacher
  belongs_to :school

  def hours_for_teaching
    disposal_duration < teacher.teaching_hours ?
      disposal_duration : teacher.teaching_hours
  end

end
