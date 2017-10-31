class SchoolTeacherResponse < ApplicationRecord
  belongs_to :school_teacher_request
  has_one :decision_file

  def to_s
    "#{decision_no}/#{decision_year} #{school_teacher_request.school_teacher.teacher.person.short_name} " +
     "#{school_teacher_request.request_specification.description} " +
      "για #{school_teacher_request.duration} από " +
      "#{school_teacher_request.starting_date}"
  end
end
