class SchoolTeacherRequest < ApplicationRecord
  belongs_to :school_teacher
  belongs_to :request_specification

  

  def description
    "#{school_teacher.short_s} "+
      "(#{school_teacher.teacher.teacher_working_class.description}) #{request_specification.description} " +
      "για #{duration} μέρα/ες ξεκινώντας από #{starting_date}"
  end

  def self.open_cases
    #TODO : There should be a more portable way of doing this :
    SchoolTeacherRequest.find_by_sql("select * from school_teacher_requests " +
                                     "where id not in " + 
                                     "(select school_teacher_requests.id from " +
                                     "school_teacher_requests join " + 
                                     "school_teacher_responses on " +
                                     "school_teacher_requests.id=school_teacher_responses.school_teacher_request_id)")
  end
end
