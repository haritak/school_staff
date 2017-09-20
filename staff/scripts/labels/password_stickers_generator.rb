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

    last_name = student.last_name[0..8]
    first_name = student.first_name[0..8]
    father_name = student.father_name[0..8]

    y = 58 #55
    pdf.draw_text "ΕΠΩΝΥΜΟ  :",    at: [5,y-=10], size: 7
    pdf.draw_text "ΟΝΟΜΑ    :",    at: [5,y-=10], size: 7
    pdf.draw_text "ΠΑΤΡΩΝΥΜΟ:",    at: [5,y-=10], size: 7
    pdf.draw_text "username :",    at: [5,y-=10], size: 7
    pdf.draw_text "password :",    at: [5,y-=10], size: 7

    y = 58 #55
    pdf.draw_text last_name,      at: [55,y-=10], size: 10
    pdf.draw_text first_name,     at: [55,y-=10], size: 10
    pdf.draw_text father_name,    at: [55,y-=10], size: 8
    pdf.draw_text username,       at: [55,y-=10], size: 8
    pdf.draw_text password,       at: [55,y-=10], size: 8

    count = (count+=1) % 3
  end

end


exit

