#!../bin/rails runner 
#
#run this script with:
#bin/rails runner path/to/filename.rb
#
#
#
#

school_grade_specialties = [
  ["Α", "Α_Γενικής Παιδείας", "Α"],
  ["ΑΕ", "Α_Επιλογής", "Α"],
  ["Β", "Β_Γενικής Παιδείας", "Β"],
  ["ΒΠ", "Β_Πληροφορικής", "Β"],
  ["ΒΓ", "Β_Γεωπονίας Τροφίμων και Περιβάλλοντος", "Β"],
  ["ΒΗ", "Β_Ηλεκτρολογίας Ηλεκτρονικής και Αυτοματισμού", "Β"],
  ["ΒΜ", "Β_Μηχανολογίας", "Β"],
  ["ΒΟΙΚ", "Β_Διοίκησης και Οικονομίας", "Β"],
  ["ΒΥ", "Β_Υγείας Πρόνοιας και Ευεξίας", "Β"],
  ["Γ", "Γ_Γενικής Παιδείας", "Γ"],
  ["ΓΤΤ", "Γ_Γεωπονίας Τεχνολογίας Τροφίμων και Ποτών", "Γ"],
  ["ΓΦΠ", "Γ_Γεωπονίας Φυτικής Παραγωγής", "Γ"],
  ["ΓΗΝ", "Γ_Ηλεκτρονικών", "Γ"],
  ["ΓΜΚ", "Γ_Τεχνικός Μηχανολογικών Εγκαταστάσεων και Κατασκευών", "Γ"],
  ["ΓΟΙΚ", "Γ_Υπάλληλος Διοίκησης και Οικονομικών", "Γ"],
  ["ΓΟΧ", "Γ_Τεχνικός Οχημάτων", "Γ"],
  ["ΓΠ", "Γ_Πληροφορικής", "Γ"],
  ["ΓΥ", "Γ_Βοηθός Νοσηλευτή", "Γ"],
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

