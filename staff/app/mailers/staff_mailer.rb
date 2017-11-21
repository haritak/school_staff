class StaffMailer < ApplicationMailer
  def inform_applicant( school_teacher_request )
    @school_teacher_request = school_teacher_request
    settings = 
      Setting.find_by( school: @school_teacher_request.school_teacher.school )
    person = @school_teacher_request.school_teacher.teacher.person
    starting_date = school_teacher_request.starting_date
    duration = school_teacher_request.duration
    attachments['αίτηση.odt'] = File.read( school_teacher_request.filename )
    mail(
      from: 'GeoStaff <artemis1epalmoiron@gmail.com>',
      to: person.notification_email.split, 
      subject: "Αίτηση άδειας #{person.short_name} για #{duration}, από #{starting_date}",
    )
  end

  def inform_manager( school_teacher_request )
    @school_teacher_request = school_teacher_request
    settings = 
      Setting.find_by( school: @school_teacher_request.school_teacher.school )
    person = @school_teacher_request.school_teacher.teacher.person
    starting_date = school_teacher_request.starting_date
    duration = school_teacher_request.duration
    attachments['αίτηση.odt'] = File.read( school_teacher_request.filename )
    mail(
      from: 'GeoStaff <artemis1epalmoiron@gmail.com>',
      to: settings.mng_email.split,
      subject: "Αίτηση άδειας #{person.short_name} για #{duration}, από #{starting_date}",
    )
  end

  def inform_other( school_teacher_request )
    @school_teacher_request = school_teacher_request
    settings = 
      Setting.find_by( school: @school_teacher_request.school_teacher.school )
    person = @school_teacher_request.school_teacher.teacher.person
    starting_date = school_teacher_request.starting_date
    duration = school_teacher_request.duration
    attachments['αίτηση.odt'] = File.read( school_teacher_request.filename )
    mail(
      from: 'GeoStaff <artemis1epalmoiron@gmail.com>',
      to: settings.adeies_email.split,
      cc: settings.ypo1_email.split,
      bcc: settings.ypo2_email.split,
      subject: "Αίτηση άδειας #{person.short_name} για #{duration}, από #{starting_date}",
    )
  end
end
