#!bin/rails runner

filename = $ARGV[0]

IGNORE_NON_EXISTENT_CLASSES = true

schoolid = "1740300" # all go to epal moiron
schoolyear = 2017 #all go to 2017-2018

Target_school = School.find_by( code: schoolid )
Target_schoolyear = Schoolyear.find_by( startingyear: schoolyear )

exit if not filename

def find_student( s )
  found_student = nil
  begin
    found_student = Student.find_by( last_name: s[:last_name],
                  first_name: s[:first_name],
                  father_name: s[:father_name],
                  mother_name: s[:mother_name] )
  rescue => e
  end
  return found_student
end

def find_school_student( s )
  student = find_student s
  school_student = SchoolStudent.find_by( school: Target_school,
                        schoolyear: Target_schoolyear,
                        student: student )
end

def calculate_serial( student )
  sprintf "EMS%02d%04d",
    schoolyear[-2..-1],
    SchoolStudent.where(school: Target_school, 
                        schoolyear: Target_schoolyear).count
end

def store_student( student )
  serial_no = calculate_serial( student )
  stored_student = Student.create( serial_no: serial_no,
                                  last_name: student[ :last_name ],
                                  first_name: student[ :first_name ],
                                  father_name: student[ :father_name ],
                                  mother_name: student[ :mother_name ] )
  puts "Stored student #{serial_no} #{student[:last_name]}"
end

def store_school_student( student )
  stored_student = find_student student

  stored_school_student = SchoolStudent.create( student: stored_student,
                                               school: Target_school,
                                               schoolyear: Target_schoolyear )

  puts "Stored school student #{stored_student.last_name}"
end


puts
puts "Reading from "
puts "#{filename}"
puts

puts "Ignoring classes that do not exist" if IGNORE_NON_EXISTENT_CLASSES
puts

puts "I expect a comma separated line with :"
puts
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
$stdin.gets

if IGNORE_NON_EXISTENT_CLASSES
  puts "School_classes that do not exists in database will be ignored"
  puts "press enter to continue"
  $stdin.gets
end

students=[]
File.open( filename ).readlines.each_with_index do |line, i|
  i+=1
  line = line.split(",")
  last_name = line[1].strip
  first_name = line[2].strip
  father_name = line[3].strip
  mother_name = line[4].strip

  next if last_name == "" and first_name == ""
  next if last_name =~ /.*π.νυμο.*/

  school_class = line[5].strip.split[0]

  if school_class =~ /.*([Α-Δ]+)([0-9]+).*/
    school_grade = $1.strip
    school_class_number = $2.strip
  else
    if not IGNORE_NON_EXISTENT_CLASSES
      puts "Warning! Couldn't detetect school class in line #{i} #{line}"
    end
    next
  end

  #puts "#{last_name} #{first_name} του #{father_name} και της #{mother_name} στο #{school_class_number}ο τμήμα της #{school_grade}"

  raise "Error detected in line #{i} " if last_name=="" or
    first_name=="" or father_name=="" or mother_name=="" or school_class==""

  school_grade = SchoolGradeSpecialty.find_by( code: school_grade )
  school_class = SchoolClass.find_by( school_grade_specialty: school_grade, 
                                     number: school_class_number.to_i )

  if not school_class
    if not IGNORE_NON_EXISTENT_CLASSES
      puts "Warning! Couldn't find school class for #{line}"
    else
      next
    end
  end

  #puts "Found #{school_class} for #{last_name} #{first_name}"
  #
  students << { last_name: last_name, 
                first_name: first_name, 
                father_name: father_name, 
                mother_name: mother_name, 
                school_class: school_class }
end

puts "First pass of the file succesfull (#{students.length} no students}). Please handle any warnings."
puts 
puts "Hit enter to see the list of students"
$stdin.gets

school_sums = {}
students.each do |s|
  puts "#{s[ :last_name ]} #{s[ :first_name ]} του #{s[ :father_name ]} και της #{s[ :mother_name ]} τμήμα #{s[ :school_class ]}"

  school_sums[ s[:school_class] ] = 0 if not school_sums[ s[:school_class] ]
  school_sums[ s[:school_class] ] += 1
end

school_sums.each do |k, v|
  puts "#{k} -> #{v}"
end

puts "Next step is to store only NEW students."
$stdin.gets

students.each do |s|
  store_student s if not find_student s

  school_student = find_school_student s
  store_school_student s if not school_student
end

puts "All students exist in the above school, school year"
puts
puts "Next step is to MOVE students to the correct school class."
puts
$stdin.gets

students.each do |s|
  school_student = find_school_student s

  no_change = true
  begin
    school_class_student = 
      SchoolClassStudent.find_by( school_student: school_student,
                                 school_class: s[ :school_class ] )
  rescue => e
    no_change = false
  end

  no_change = false if not school_class_student

  if no_change
    #puts "#{s[:last_name]} #{s[:first_name]} remains"
  else

    school_class_student = 
      SchoolClassStudent.find_by( school_student: school_student )

    from = nil;
    from = school_class_student.school_class if school_class_student

    to = s[:school_class]
    print "#{s[:last_name]} #{s[:first_name]} has to move from #{from} to #{to}"

    school_class_student.destroy if school_class_student
    SchoolClassStudent.create( school_student: school_student, 
                              school_class: to )

    puts " DONE"
  end
end

puts "Done"
