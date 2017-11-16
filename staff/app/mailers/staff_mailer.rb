class StaffMailer < ApplicationMailer
  def new_school_teacher_request( school_teacher_request )
    @school_teacher_request = school_teacher_request
    settings = 
      Setting.find_by( school: @school_teacher_request.school_teacher.school )
    person = @school_teacher_request.school_teacher.teacher.person
    starting_date = school_teacher_request.starting_date
    duration = school_teacher_request.duration
    attachments['αίτηση.odt'] = File.read( school_teacher_request.filename )
    mail(
      from: 'GeoStaff <artemis1epalmoiron@gmail.com>',
      to: [settings.mng_email, settings.ypo1_email],
      cc: [settings.ypo2_email, settings.adeies_email, person.notification_email],
      subject: "Αίτηση άδειας #{person.short_name} για #{duration}, από #{starting_date}",
    )
  end
end
