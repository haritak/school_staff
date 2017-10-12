#!bin/rails runner
#
require "digest"

require 'rqrcode' #https://github.com/whomwah/rqrcode
require 'prawn/labels' #https://github.com/madriska/prawn-labels
require 'prawn-svg' #https://github.com/mogest/prawn-svg

Prawn::Labels.types = 'custom.yaml'

LabelsType = "AveryL6011_hpP2015"

SRV_URL = "srv-1tee-moiron.ira.sch.gr"
SRV_PORT= "4000"

base_dir = Rails.root.join "scripts/ktel"
tmp_dir = "#{base_dir}/tmp"
students_csv = "#{base_dir}/students.csv"

if not File.directory?(tmp_dir) 
  puts "Error! Temporary directory does not exists"
  exit
end

if not Dir.empty?(tmp_dir)
  puts "Warning! Target directory (#{tmp_dir}) not empty."
  puts "It is strongly recommented to empty it before running this program."
end


File.open(students_csv, "r").each_line do |line|
  parts = line.split ","
  p parts
end

exit


students = []
27.times do |no|
  number = 1 + no

  students << { serial: 20171012170750,
               last_name: "ΠΑΠΑΓΙΑΝΝΑΚΗΣ-ΚΙΣΤΕΝΜΑΧΕΡ",
               first_name: "ΜΑΝΟΥΣΟΣ-ΚΩΝΣΤΑΝΤΙΝΟΣ",
               father_name: "ΜΑΝΟΥΣΟΣ-ΚΩΝΣΤΑΝΤΙΝΟΣ",
               road_start: "ΦΟΥΡΝΟΦΑΡΑΓΓΟ",
               class: "Γ ΛΥΚΕΙΟΥ",
               specialty_class: "ΓΠ",
               school: "1ο ΕΠΑΛ ΜΟΙΡΩΝ"
  }

  #break if (number) > 2
end

Prawn::Labels.generate("student-stickers.pdf", students,
                       :type => LabelsType) do |pdf, student|
  pdf.font "FreeMono.ttf"

  qrcode = RQRCode::QRCode.new("EMSyyyymmddhhmmss")
  svg = qrcode.as_svg

  filename = "#{tmp_dir}/#{student[ :serial ]}.svg"
  if File.exist?( filename ) 
    puts "Warning! Duplicate code for student, unless you forgot to clean tmp/"
    puts filename
  end
  IO.write(filename, svg.to_s)

  #pdf.svg IO.read(filename), at: [4,55], width: 50, height: 50

  y = 70
  pdf.svg IO.read(filename), at: [115,y], width: 50, height: 50

  y = 90
  pdf.draw_text student[ :school ],                          at: [45,y-=14], size: 12
  pdf.draw_text "#{student[ :class ]} #{student[ :specialty_class]}", at: [20,y-=10], size: 10
  pdf.draw_text "ΕΠΩΝ:",       at: [4,y-=10], size: 10
  pdf.draw_text "    :#{student[ :last_name ][0,13]}",       at: [4,y], size: 10
  pdf.draw_text "ΟΝΟΜ:",       at: [4,y-=10], size: 10
  pdf.draw_text "    :#{student[ :first_name][0,13]}",       at: [4,y], size: 10
  pdf.draw_text "ΠΑΤΡ:",      at: [4,y-=10], size: 10
  pdf.draw_text "    :#{student[ :father_name][0,13]}",      at: [4,y], size: 10
  pdf.draw_text "#{student[ :road_start ][0,13]}", at: [4,y-=12], size: 12
  pdf.draw_text " -ΜΟΙΡΕΣ- #{student[ :road_start ][0,10]}.",  at: [4,y-=12], size: 12
end

if LabelsType.start_with?("AveryL60") then puts "Watch it : SILVER LABELS!" end
