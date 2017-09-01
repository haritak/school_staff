#!../bin/rails runner 
#
#run this script with:
#bin/rails runner path/to/filename.rb
#
#
#
reference =  "29071 9 Αυγούστου 2017 ΤΕΥΧΟΣ ΔΕΥΤΕΡΟ Αρ. Φύλλου 2797"

# First array : lesson data
# Second array : first priority of assignemnts (priority 100, 101 ...)
# Third array : second priority of assignemnts (priority 200, 201 ...)
# Fourth array : third priority of assignemnts (priority 300, 301 ...)

lesson_assignments = [
[["ΓΦΠ", "Σύγχρονες Γεωργικές Επιχειρήσεις"],
 ["ΠΕ14.04","ΠΕ14.05",
  "ΠΕ18.12","ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
  [],
  []
],
[["ΓΦΠ", "Αρχές Βιολογικής Γεωργίας"],
 ["ΠΕ14.04",
  "ΠΕ18.12","ΠΕ18.13","ΠΕ18.30","ΠΕ18.36"],
  ["ΠΕ14.05",
   "ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17"],
   []
],
[["ΓΦΠ", "Δενδροκομία - Αμπελουργία"],
 ["ΠΕ14.04",
  "ΠΕ18.12","ΤΕ01.33"],
  ["ΠΕ14.05",
   "ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
   []
],
[
  ["ΓΦΠ", "Φυτά Μεγάλης Καλλιέργειας-Κηπευτικές Καλλιέργειες"],
 ["ΠΕ14.04",
  "ΠΕ18.12","ΤΕ01.33"],
  ["ΠΕ14.05",
   "ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
   []
],
[ ["ΓΦΠ", "Αρδεύσεις Καλλιεργειών"],
 ["ΠΕ14.04",
  "ΠΕ18.12",
  "ΤΕ01.33"],
  ["ΠΕ14.05",
   "ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
   []
],
[["ΓΦΠ", "Φυτοπροστασία"],
 ["ΠΕ14.04",
  "ΠΕ18.12","ΤΕ01.33"],
  ["ΠΕ14.05",
   "ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
   []
],
]

def get_lesson_type(lesson)
  lesson_type = "*" #will check both
  lesson_type = lesson[2] if lesson.length == 3
  return lesson_type
end


puts "#{lesson_assignments.length} assignments loaded."
puts "Checking school_grade_specialties"
lesson_assignments.each do |la|
  lesson = la[0]
  raise "Not found #{lesson}" if not SchoolGradeSpecialty.find_by( code: lesson[0] )
end

puts "Checking lesson types"
lesson_assignments.each do |la|
  lesson = la[0]
  lesson_type = get_lesson_type( lesson )

  if lesson_type != "*" 
    raise "Not found lesson type #{lesson}, #{lesson_type}" if not LessonType.find_by( code: lesson_type )
  end
end

puts "Checking lessons" 
lesson_assignments.each do |la|
  lesson = la[0]
  lesson_type = get_lesson_type( lesson )
  school_grade_specialty = SchoolGradeSpecialty.find_by( code: lesson[0] )
  theLesson = nil
  if lesson_type != "*"
    lesson_type = LessonType.find_by( code: lesson_type )
    theLesson = Lesson.find_by( lesson_type: lesson_type, 
                          school_grade_specialty: school_grade_specialty,
                          description: lesson[1])
  else
    theLesson = Lesson.find_by( 
                          school_grade_specialty: school_grade_specialty,
                          description: lesson[1])
  end
  raise "Not found lesson #{lesson[1]}, #{lesson_type}, #{school_grade_specialty.code}" if not theLesson
end

def check_specialties(specialties)
  return if not specialties
  specialties.each do |specialty|
    raise "Not found #{specialty}" if not Specialty.find_by( code: specialty )
  end
end

puts "Checking specialties"
lesson_assignments.each do |la|
  #begin
    check_specialties(la[1])
    check_specialties(la[2])
    check_specialties(la[3])
  #rescue => e
    #puts e
    #p la
    #puts "----"
  #end
end

puts "Ready to store assignments to database."
puts "Press enter to continue"

gets

lesson_assignments.each do |la|
  lesson = la[0]
  lesson_type = get_lesson_type( lesson )
  theLessons = []
  school_grade_specialty = SchoolGradeSpecialty.find_by( code: lesson[0] )
  if lesson_type != "*"
    lesson_type = LessonType.find_by( code: lesson_type )
    theLesson = Lesson.find_by( lesson_type: lesson_type, 
                               school_grade_specialty: school_grade_specialty,
                               description: lesson[1])
    theLessons << theLesson
  else
    theLesson = Lesson.where( school_grade_specialty: school_grade_specialty,
                             description: lesson[1]).to_a
    theLessons += theLesson
  end

  theLessons.each do |theLesson|
    #priority 1 -> 100, 101, 102, ...
    [ la[1], la[2], la[3]].each_with_index do |la, level|
      next if not la
      la.each_with_index do |spec, index|
        priority = 100 + level*100 + index
        theSpecialty = Specialty.find_by( code: spec)
        begin
          LessonAssignment.create( lesson: theLesson,
                                  specialty: theSpecialty,
                                  priority: priority,
                                  reference: reference )
          puts "NEW Assignment #{theLesson.description}-#{theLesson.lesson_type.code} with #{theSpecialty.code}"
        rescue ActiveRecord::RecordNotUnique => e
          puts "Assignment #{theLesson.description} - #{theSpecialty.code} already exists"
        end#rescue
      end
    end

  end#each of theLessons

end#each lesson_assignments


