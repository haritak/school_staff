#!bin/rails runner
#
require "digest"

require 'rqrcode' #https://github.com/whomwah/rqrcode
require 'prawn/labels' #https://github.com/madriska/prawn-labels
require 'prawn-svg' #https://github.com/mogest/prawn-svg


LabelsType = "AveryL6011_hpP2015"

SRV_URL = "http://srv-1tee-moiron.ira.sch.gr"
SRV_PORT= "12345"

base_dir = Rails.root.join "scripts/ktel"
tmp_dir = "#{base_dir}/tmp"
students_csv = "#{base_dir}/students.csv"

Prawn::Labels.types = "#{base_dir}/custom.yaml"

if not File.directory?(tmp_dir) 
  puts "Error! Temporary directory does not exists"
  exit
end

if not Dir.empty?(tmp_dir)
  puts "Warning! Target directory (#{tmp_dir}) not empty."
  puts "It is strongly recommented to empty it before running this program."
end


students = []
File.open(students_csv, "r").each_line do |line|
  parts = line.split ","
  #p parts
  students << { serial: "",
                last_name: parts[1].strip,
                first_name: parts[2].strip,
               father_name: "",
               road_start: parts[3].strip,
               class: "",
               specialty_class: "",
               school: "1ο ΕΠΑΛ ΜΟΙΡΩΝ",
               ktel_id: parts[6].strip,
  }
end

not_found_students = []
students.each do |student|
  db_students = Student.where( last_name: student[ :last_name ],
                               first_name: student[ :first_name ] ).to_a
  if db_students.length == 0
    not_found_students << student
    next
  end

  db_student = db_students[0]
  if db_students.length > 1 
    puts "CONFLICT DETECTED"
    puts db_students
    puts
    puts "Please select (starts with 0, give -1 to select all):"
    puts
    select = $stdin.gets.to_i
    db_student = db_students[ select ]
  end

  student[ :father_name ] = db_student.father_name
  student[ :serial ] = db_student.serial_no

  db_sc = SchoolStudent.find_by( student: db_student )
  db_scs = SchoolClassStudent.where( school_student: db_sc ).to_a
  db_scs.each do |scs|
    class_code = scs.school_class.school_grade_specialty.code
    puts class_code
    student[ :class ] = "#{class_code} ΛΥΚΕΙΟΥ (#{scs.school_class})"
  end


  p student
end

puts "End of fixing father_names and serials"
puts "Hit enter to show which students were not found"
$stdin.gets

puts


if not_found_students.length > 0
  puts "=================================="
  puts "Following students were not found."
  not_found_students.each do |nfs|
    puts nfs
  end
  puts "=================================="
end




puts "Hit enter to create labels"
$stdin.gets

puts

puts "Started"

Prawn::Labels.generate("student-stickers.pdf", students,
                       :type => LabelsType) do |pdf, student|
  pdf.font "#{base_dir}/FreeMono.ttf"

  url = "#{SRV_URL}:#{SRV_PORT}/#{student[ :serial ]}"
  qrcode = RQRCode::QRCode.new( url )
  svg = qrcode.as_svg

  filename = "#{tmp_dir}/#{student[ :serial ]}.svg"
  if File.exist?( filename ) 
    puts "Warning! Duplicate code for student, unless you forgot to clean tmp/"
    puts filename
  end
  IO.write(filename, svg.to_s)

  #pdf.svg IO.read(filename), at: [4,55], width: 50, height: 50

  y = 72 #70
  pdf.svg IO.read(filename), at: [113,y], width: 50, height: 50

  y = 90
  pdf.draw_text "[#{student[ :ktel_id ]}]",                          at: [118,y-=14], size: 12
  pdf.draw_text student[ :school ],                          at: [15,y], size: 12
  pdf.draw_text "#{student[ :class ]} #{student[ :specialty_class]}", at: [20,y-=10], size: 10
  pdf.draw_text "ΕΠΩΝ:",       at: [4,y-=10], size: 10
  pdf.draw_text "    :#{student[ :last_name ][0,13]}",       at: [4,y], size: 10
  pdf.draw_text "ΟΝΟΜ:",       at: [4,y-=10], size: 10
  pdf.draw_text "    :#{student[ :first_name][0,13]}",       at: [4,y], size: 10
  pdf.draw_text "ΠΑΤΡ:",      at: [4,y-=10], size: 10
  pdf.draw_text "    :#{student[ :father_name][0,13]}",      at: [4,y], size: 10
  if student[ :road_start ].length > 7
    pdf.draw_text "#{student[ :road_start ][0,13]}", at: [4,y-=12], size: 12
    pdf.draw_text " -ΜΟΙΡΕΣ- #{student[ :road_start ][0,10]}.",  at: [4,y-=12], size: 12
  else
    pdf.draw_text "#{student[ :road_start ]}-ΜΟΙΡΕΣ-", at: [4,y-=12], size: 12
    pdf.draw_text "#{student[ :road_start ][0,14]}.",  at: [4,y-=12], size: 12
  end
end

if LabelsType.start_with?("AveryL60") then puts "Watch it : SILVER LABELS!" end
