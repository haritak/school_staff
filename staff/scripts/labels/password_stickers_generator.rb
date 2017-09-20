#!bin/rails runner
#
require 'rqrcode' #https://github.com/whomwah/rqrcode
require 'prawn/labels' #https://github.com/madriska/prawn-labels
require 'prawn-svg' #https://github.com/mogest/prawn-svg

Prawn::Labels.types = 'scripts/labels/custom.yaml'

LabelsType = "TypoLabel6511"
tmp_dir = "./scripts/labels/tmp"

a = SchoolClassStudent.joins( :school_student ).all.order( :school_class_id, :school_student_id )

school_classes={}
a.each do |s|
  if not school_classes[ s.school_class ]
    school_classes[ s.school_class ] = []
  end

  school_classes[ s.school_class ] << s #για το τετράδιο
  school_classes[ s.school_class ] << s #Spare
end

school_classes.each do |k, v|
  puts k
  pdf_filename = "scripts/labels/#{k}-passwords.pdf"

  count = 0
  Prawn::Labels.generate(pdf_filename, v, 
                         :type => LabelsType) do |pdf, school_class_student|
    pdf.font "scripts/labels/FreeMono.ttf"
    school_student = school_class_student.school_student
    student = school_student.student

    username = school_student.username
    password = school_student.password
    if not password or not username
      p student
      puts "Warning! Student without password or username"
      username = "CONTACT"
      password = "SUPPORT"
    end

    last_name = student.last_name[0..10]
    first_name = student.first_name[0..10]
    father_name = student.father_name[0..10]

    if username.length>10 or password.length>10
      puts "Warning! Password or username too long for #{last_name}"
    end

    y = 58 #55
    pdf.draw_text "επων",       at: [5,y-=8], size: 7
    pdf.draw_text "ονομ",       at: [5,y-=8], size: 7
    pdf.draw_text "πατρ",       at: [5,y-=8], size: 7
    pdf.draw_text "user",       at: [5,y-=11], size: 7
    pdf.draw_text "pass",       at: [5,y-=11], size: 7

    y = 58 #55
    pdf.draw_text last_name,      at: [25,y-=8], size: 8
    pdf.draw_text first_name,     at: [25,y-=8], size: 8
    pdf.draw_text father_name,    at: [25,y-=8], size: 8
    pdf.draw_text username,       at: [25,y-=11], size: 11
    pdf.draw_text password,       at: [25,y-=11], size: 11

    count = (count+=1) % 3
  end

end


exit

