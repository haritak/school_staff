class StaffMailer < ApplicationMailer
  def new_school_teacher_request( school_teacher_request )
    @school_teacher_request = school_teacher_request
    person = @school_teacher_request.school_teacher.teacher.person
    mail(to:'charitakis.ioannis@gmail.com', subject:'Νέα αίτηση')
  end
end
