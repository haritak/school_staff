class SchoolTeacherRequest < ApplicationRecord
  belongs_to :school_teacher
  belongs_to :request_specification

  def description
    "#{school_teacher.short_s} "+
      "(#{school_teacher.teacher.teacher_working_class.description}) #{request_specification.description} " +
      "για #{duration} μέρα/ες ξεκινώντας από #{starting_date}"
  end
end
