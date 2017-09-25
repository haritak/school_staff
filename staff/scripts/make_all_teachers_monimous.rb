#!bin/rails runner 
#
#run this script with:
#bin/rails runner path/to/filename.rb
#
#
#

monimos = TeacherWorkingClass.find_by( code: "M" )

Teacher.all.each do |teacher|
  teacher.update( teacher_working_class: monimos )
end

puts "All done"
