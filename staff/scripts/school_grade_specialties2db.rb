#!../bin/rails runner 
#
#run this script with:
#bin/rails runner path/to/filename.rb
#
#
#
#

school_grade_specialties = [
  ["Α", "Γενικής Παιδείας", "Α"],
  ["ΑΕ", "Επιλογής", "Α"],
  ["Β", "Γενικής Παιδείας", "Β"],
  ["ΒΠ", "Πληροφορικής", "Β"],
  ["ΒΓ", "Γεωπονίας Τροφίμων και Περιβάλλοντος", "Β"],
  ["ΒΗ", "Ηλεκτρολογίας Ηλεκτρονικής και Αυτοματισμού", "Β"],
  ["ΒΜ", "Μηχανολογίας", "Β"],
  ["ΒΟΙΚ", "Διοίκησης και Οικονομίας", "Β"],
  ["ΒΥ", "Υγείας Πρόνοιας και Ευεξίας", "Β"],
  ["Γ", "Γ Γενικής Παιδείας", "Γ"],
  ["ΓΤΤ", "Γεωπονίας Τεχνολογίας Τροφίμων και Ποτών", "Γ"],
  ["ΓΦΠ", "Γεωπονίας Φυτικής Παραγωγής", "Γ"],
  ["ΓΗΝ", "Ηλεκτρονικών", "Γ"],
  ["ΓΜΚ", "Τεχνικός Μηχανολογικών Εγκαταστάσεων και Κατασκευών", "Γ"],
  ["ΓΟΙΚ", "Υπάλληλος Διοίκησης και Οικονομικών", "Γ"],
  ["ΓΟΧ", "Τεχνικός Οχημάτων", "Γ"],
  ["ΓΠ", "Πληροφορικής", "Γ"],
  ["ΓΥ", "Βοηθός Νοσηλευτή", "Γ"],
]

school_grade_specialties.each do |sgs|
  school_grade = SchoolGrade.find_by(code: sgs[2])
  raise "Not found school_grade #{sgs[2]}" if not school_grade
  begin
    SchoolGradeSpecialty
      .create( code: sgs[0], description: sgs[1], school_grade: school_grade )
    p sgs
  rescue ActiveRecord::RecordNotUnique => e
    puts "#{sgs.to_s}: already exists"
  end
end

puts "All done"

