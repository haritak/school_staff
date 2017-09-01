#!../bin/rails runner 
#
#run this script with:
#bin/rails runner path/to/filename.rb
#
#
#

reference3 = "13367 26 Απριλίου 2017 ΤΕΥΧΟΣ ΔΕΥΤΕΡΟ Αρ. Φύλλου 1426" 
reference4 = "20773 15 Ιουνίου 2017 ΤΕΥΧΟΣ ΔΕΥΤΕΡΟ Αρ. Φύλλου 2072" 

def create_abbr( string )
  return string if string.length<8
  a = string.split
  abbr = ""
  a.each do |s|
    abbr += s[0..3]
  end
  return abbr[0..7] if abbr.length>8
  return string[0..7] if abbr.length<8
  abbr
end

lessons_before = [ # reference3
  ["ΓΦΠ", "Σύγχρονες Γεωργικές Επιχειρήσεις", 3, "Θ",reference3],
  ["ΓΦΠ", "Αρχές Βιολογικής Γεωργίας", 3, "Θ",reference3],
  ["ΓΦΠ", "Δενδροκομία - Αμπελουργία", 2, "Θ",reference3],
  ["ΓΦΠ", "Δενδροκομία - Αμπελουργία", 3, "Ε",reference3],
  ["ΓΦΠ", "Φυτά Μεγάλης Καλλιέργειας", 2, "Θ",reference3],
  ["ΓΦΠ", "Φυτά Μεγάλης Καλλιέργειας", 2, "Ε",reference3],
  ["ΓΦΠ", "Κηπευτικές Καλλιέργειες - Αρδεύσεις", 2, "Θ",reference3],
  ["ΓΦΠ", "Κηπευτικές Καλλιέργειες - Αρδεύσεις", 3, "Ε",reference3],
  ["ΓΦΠ", "Φυτοπροστασία", 2, "Θ",reference3],
  ["ΓΦΠ", "Φυτοπροστασία", 1, "Ε",reference3],
]

lessons_after = [ # reference4
  ["ΓΦΠ", "Σύγχρονες Γεωργικές Επιχειρήσεις", 3, "Θ",reference4],
  ["ΓΦΠ", "Αρχές Βιολογικής Γεωργίας", 3, "Θ",reference4],
  ["ΓΦΠ", "Δενδροκομία - Αμπελουργία", 2, "Θ",reference4],
  ["ΓΦΠ", "Δενδροκομία - Αμπελουργία", 3, "Ε",reference4],
  ["ΓΦΠ", "Φυτά Μεγάλης Καλλιέργειας-Κηπευτικές Καλλιέργειες", 2, "Θ",reference4],
  ["ΓΦΠ", "Φυτά Μεγάλης Καλλιέργειας-Κηπευτικές Καλλιέργειες", 3, "Ε",reference4],
  ["ΓΦΠ", "Αρδεύσεις Καλλιεργειών", 1, "Θ",reference4],
  ["ΓΦΠ", "Αρδεύσεις Καλλιεργειών", 2, "Ε",reference4],
  ["ΓΦΠ", "Φυτοπροστασία", 2, "Θ",reference4],
  ["ΓΦΠ", "Φυτοπροστασία", 2, "Ε",reference4],
]

puts "Searching old lessons"
begin
  lessons_before.each do |lb|
    lesson_type = LessonType.find_by( code: lb[3] )
    lesson = Lesson.find_by( description: lb[1], 
                            lesson_type: lesson_type )
    raise "Not found lesson #{lb[1]}" if not lesson
  end

  puts "Renaming old lessons. Hit enter to continue"
  gets

  lessons_before.each do |lb|
    lesson_type = LessonType.find_by( code: lb[3] )
    lesson = Lesson.find_by( description: lb[1], 
                            lesson_type: lesson_type )
    lesson.abbr += " deprecated due to " + reference4
    lesson.description += " deprecated due to " + reference4
    lesson.save
  end
rescue => e
  p e
  puts
  puts "Seems old lessons have been renamed already."
end


puts "Searching old school_grade_specialty"
begin
  old_school_grade_specialty = SchoolGradeSpecialty.find_by( code: "ΓΦΠ" )
  raise "Not found ΓΦΠ" if not old_school_grade_specialty

  puts "Ready to rename old school grade specialty. Hit enter to continue."
  gets


  old_school_grade_specialty.code += " deprecated due to " + reference4
  old_school_grade_specialty.description += "deprecated due to " + reference4
  old_school_grade_specialty.save
rescue => e
  p e
  puts "Seems school grade specialty has already been renamed."
end


#Second step:
#Create the new school_grade_specialty
#

puts "Creating new school_grade_specialty. Hit enter to continue."
gets

school_grade = SchoolGrade.find_by( code: "Γ" )

begin
  new_school_grade_specialty = SchoolGradeSpecialty.create( code: "ΓΦΠ", 
                                                           description: "Γ_Γεωπονίας Φυτικής Παραγωγής", 
                                                           school_grade: school_grade )
rescue => e
  p e
  puts "Seems new school_grade_specialty has been already created."
end

lessons_after.each do |lesson|
  puts lesson[0] + "_" + create_abbr(lesson[1])+"_"+lesson[3]
end

school_grade_specialties = {}
lessons_after.each do |lesson|
  if lesson.length != 5
    puts lesson
    raise "Error!"
  end
  p lesson
  school_grade_specialties[ lesson[0] ] ||= 0
  school_grade_specialties[ lesson[0] ] += lesson[2]
  raise "Not found lesson type for #{lesson[1]}" if not LessonType.find_by( code: lesson[3] ) 
end


school_grade_specialties.each do |k, v|
  puts "#{k} has #{v} hours"
  raise "Not found #{k}" if not SchoolGradeSpecialty.find_by( code: k )
end

puts "Ready to store new lessons to new school_grade_specialties. Hit enter to continue."
gets

lessons_after.each do |lesson|
  school_grade_specialty = SchoolGradeSpecialty.find_by( code: lesson[0] )
  lesson_type = LessonType.find_by( code: lesson[3] )
  description = lesson[1]
  abbr = create_abbr description
  abbr = lesson[0] + "_" + abbr +"_" + lesson[3]
  hours = lesson[2]
  begin
    Lesson.create( abbr: abbr,
                  description: description, 
                  hours: lesson[2],
                  school_grade_specialty: school_grade_specialty, 
                  lesson_type: lesson_type,
                  reference: lesson[4] )
    puts "Lesson #{abbr} created."
  rescue ActiveRecord::RecordNotUnique => e
    puts "Lesson #{abbr} already exists."
  end
end




  


