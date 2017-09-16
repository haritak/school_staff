#!bin/rails runner

filename = $ARGV[0]

schoolid = "1740300" # all go to epal moiron

target_school = School.find_by( code: schoolid )

exit if not filename

puts "Reading from #{filename}"

puts "I expect on a comma separated line with :"
puts "First a number which is ignored,"
puts "Second the last name,"
puts "Third the first name,"
puts "Fourth the father name,"
puts "Fifth the mother name,"
puts "and sixth the class short name (eg Α1, ΓΠ,...)."
puts
puts "Everything else is ignored"
puts
puts "Hit enter to start processing the file"

students=[]
File.open( filename ).readlines.each_with_index do |line, i|
  i+=1
  line = line.split(",")
  last_name = line[1].strip
  first_name = line[2].strip
  father_name = line[3].strip
  mother_name = line[4].strip

  school_class = line[5].strip.split[0]

  if school_class =~ /.*([Α-Δ]+)([0-9]+).*/
    school_grade = $1.strip
    school_class_number = $2.strip
  else
    puts "Warning! Couldn't detetect school class in line #{i} for #{last_name} #{first_name}"
    next
  end

  #puts "#{last_name} #{first_name} του #{father_name} και της #{mother_name} στο #{school_class_number}ο τμήμα της #{school_grade}"

  raise "Error detected in line #{i} " if last_name=="" or
    first_name=="" or father_name=="" or mother_name=="" or school_class==""

  school_grade = SchoolGradeSpecialty.find_by( code: school_grade )
  school_class = SchoolClass.find_by( school_grade_specialty: school_grade, 
                                     number: school_class_number.to_i )

  raise "Couldn't find school class for #{last_name}" if not school_class
  #puts "Found #{school_class} for #{last_name} #{first_name}"
  #
  students << { last_name: last_name, 
                first_name: first_name, 
                father_name: father_name, 
                mother_name: mother_name, 
                school_class: school_class }
end

puts "First pass of the file succesfull. Please handle any warnings."
puts 
puts "Hit enter to see serial numbers for each student"
$stdin.gets

number = 7102 #2017 reversed.
students.each do |student|
  #serial_no = "#{student[:last_name][0..5].upcase}#{student[:first_name][0..2].upcase}#{student[:father_name][0].upcase}#{student[:mother_name][0].upcase}"

  serial_no = sprintf "EMST2017%04d", number
  number += 1
  student.merge!( { serial_no: serial_no } )
  puts serial_no
end

puts "Hit enter to start storing"
$stdin.gets

students.each do |student|
  stored_student = nil
  begin
    stored_student = Student.create( serial_no: student[ :serial_no ],
                 last_name: student[ :last_name ],
                 first_name: student[ :first_name ],
                 father_name: student[ :father_name ],
                 mother_name: student[ :mother_name ] )
  rescue ActiveRecord::RecordNotUnique => e
    puts "student exists"
    stored_student = Student.find_by( serial_no: student[ :serial_no ] )
  end

  stored_school_student = nil
  begin
    stored_school_student = SchoolStudent.create( school: target_school,
                       student: stored_student )
  rescue ActiveRecord::RecordNotUnique => e
    puts "student already assigned to school"
    stored_school_student = SchoolStudent.find_by( school: target_school, 
                                                  student: stored_student )
  end

  begin
    SchoolClassStudent.create( school_student: stored_school_student,
                              school_class: student[ :school_class ] )
  rescue ActiveRecord::RecordNotUnique => e
    puts "student already assigned to specific class in school"
  end
end

puts "Done"
