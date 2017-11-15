class StaffMailer < ApplicationMailer
  def new_school_teacher_request( school_teacher_request )
    @school_teacher_request = school_teacher_request
    person = @school_teacher_request.school_teacher.teacher.person
    starting_date = school_teacher_request.starting_date
    duration = school_teacher_request.duration
    attachments['αίτηση.odt'] = File.read( school_teacher_request.filename )
    mail(
      from: 'GeoStaff <artemis1epalmoiron@gmail.com>',
      to: 'charitakis.ioannis@gmail.com', 
      cc: ['bp10.charitakis@gmail.com', 'haritak@sch.gr'],
      subject: "Αίτηση άδειας #{person.short_name} για #{duration}, από #{starting_date}",
    )
  end
end
