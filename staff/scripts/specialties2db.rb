#!../bin/rails runner 
#
#run this script with:
#bin/rails runner path/to/filename.rb
#
#
#

specialties = [
  ["ΠΕ","Ολοι/ες οι ΠΕ"],
  ["ΠΕ01","ΘΕΟΛΟΓΟΙ"],
  ["ΠΕ02","ΦΙΛΟΛΟΓΟΙ"],
  ["ΠΕ03","ΜΑΘΗΜΑΤΙΚΟΙ"],
  ["ΠΕ04.01","ΦΥΣΙΚΟΙ"],
  ["ΠΕ04.02","ΧΗΜΙΚΟΙ"],
  ["ΠΕ04.03","ΦΥΣΙΟΓΝΩΣΤΕΣ"],
  ["ΠΕ04.04","ΒΙΟΛΟΓΟΙ"],
  ["ΠΕ04.05","ΓΕΩΛΟΓΟΙ"],
  ["ΠΕ05","ΓΑΛΛΙΚΗΣ"],
  ["ΠΕ06","ΑΓΓΛΙΚΗΣ"],
  ["ΠΕ07","ΓΕΡΜΑΝΙΚΗΣ"],
  ["ΠΕ08","ΚΑΛΛΙΤΕΧΝΙΚΩΝ"],
  ["ΠΕ09","ΟΙΚΟΝΟΜΟΛΟΓΟΙ"],
  ["ΠΕ10","ΚΟΙΝΩΝΙΟΛΟΓΟΙ"],
  ["ΠΕ11","ΦΥΣΙΚΗΣ ΑΓΩΓΗΣ"],
  ["ΠΕ12","Όλοι/ες οι ΠΕ12"],
  ["ΠΕ12.01","ΠΟΛΙΤΙΚΟΙ ΜΗΧΑΝΙΚΟΙ"],
  ["ΠΕ12.02","ΑΡΧΙΤΕΚΤΟΝΕΣ"],
  ["ΠΕ12.03","ΤΟΠΟΓΡΑΦΟΙ"],
  ["ΠΕ12.04","ΜΗΧΑΝΟΛΟΓΟΙ"],
  ["ΠΕ12.05","ΗΛΕΚΤΡΟΛΟΓΟΙ"],
  ["ΠΕ12.06","ΗΛΕΚΤΡΟΝΙΚΟΙ ΜΗΧΑΝΙΚΟΙ"],
  ["ΠΕ12.07","ΝΑΥΠΗΓΟΙ"],
  ["ΠΕ12.08","ΧΗΜΙΚΟΙ ΜΗΧΑΝΙΚΟΙ - ΜΕΤΑΛΛΕΙΟΛΟΓΟΙ"],
  ["ΠΕ12.10","ΦΥΣΙΚΟΙ ΡΑΔΙΟΗΛΕΚΤΡΟΛΟΓΟΙ"],
  ["ΠΕ12.11","ΜΗΧΑΝΙΚΟΙ ΠΑΡΑΓΩΓΗΣ ΚΑΙ ΔΙΟΙΚΗΣΗΣ"],
  ["ΠΕ12.12","ΜΗΧΑΝΙΚΟΙ ΚΛΩΣΤΟΫΦΑΝΤΟΥΡΓΙΑΣ"],
  ["ΠΕ12.13","ΠΕΡΙΒΑΛΛΟΝΤΟΛΟΓΩΝ"],
  ["ΠΕ13","ΝΟΜΙΚΩΝ - ΠΟΛΙΤΙΚΩΝ ΕΠΙΣΤΗΜΩΝ"],
  ["ΠΕ14","Όλοι/ες οι ΠΕ14"],
  ["ΠΕ14.01","ΙΑΤΡΟΙ"],
  ["ΠΕ14.02","ΟΔΟΝΤΙΑΤΡΟΙ"],
  ["ΠΕ14.03","ΦΑΡΜΑΚΟΠΟΙΟΙ"],
  ["ΠΕ14.04","ΓΕΩΠΟΝΟΙ"],
  ["ΠΕ14.05","ΔΑΣΟΛΟΓΙΑΣ & ΦΥΣΙΚΟΥ ΠΕΡΙΒΑΛΛΟΝΤΟΣ"],
  ["ΠΕ14.06","ΝΟΣΗΛΕΥΤΙΚΗΣ"],
  ["ΠΕ15","ΟΙΚΙΑΚΗΣ ΟΙΚΟΝΟΜΙΑΣ"],
  ["ΠΕ17","Όλοι/ες οι ΠΕ17"],
  ["ΠΕ17.01","ΠΟΛΙΤΙΚΟΙ ΑΣΕΤΕΜ"],
  ["ΠΕ17.02","ΜΗΧΑΝΟΛΟΓΟΙ ΑΣΕΤΕΜ"],
  ["ΠΕ17.03","ΗΛΕΚΤΡΟΛΟΓΟΙ ΑΣΕΤΕΜ"],
  ["ΠΕ17.04","ΗΛΕΚΡΟΝΙΚΟΙ ΑΣΕΤΕΜ"],
  ["ΠΕ17.05","ΠΟΛΙΤΙΚΟΙ ΤΕΙ - ΚΑΤΕΕ"],
  ["ΠΕ17.06","ΜΗΧΑΝΟΛΟΓΟΙ ΤΕΙ - ΝΑΥΤ. ΕΜΠ. Ν. ΤΕΙ-ΚΑΤΕΕ"],
  ["ΠΕ17.07","ΗΛΕΚΤΡΟΛΟΓΟΙ - ΗΛΕΚΤΡΟΥΡΓΟΙ - ΜΗΧΑΝΟΥΡΓΟΙ ΤΕΙ-ΚΑΤΕΕ"],
  ["ΠΕ17.08","ΗΛΕΚΤΡΟΝΙΚΟΙ ΤΕΙ-ΚΑΤΕΕ"],
  ["ΠΕ17.09","ΤΕΧΝΟΛΟΓΟΙ ΙΑΤΡΙΚΩΝ ΟΡΓΑΝΩΝ"],
  ["ΠΕ17.10","ΤΕΧΝΟΛΟΓΟΙ ΕΝΕΡΓΕΙΑΚΗΣ ΤΕΧΝΙΚΗΣ"],
  ["ΠΕ17.11","ΤΟΠΟΓΡΑΦΟΙ ΤΕΙ-ΚΑΤΕΕ"],
  ["ΠΕ17.12","ΤΕΧΝΟΛΟΓΟΙ ΠΕΤΡΕΛΑΙΟΥ ΚΑΙ ΦΥΣΙΚΟΥ ΑΕΡΙΟΥ"],
  ["ΠΕ18","Όλοι/ες ΠΕ18"],
  ["ΠΕ18.01","ΓΡΑΦΙΚΩΝ ΤΕΧΝΩΝ"],
  ["ΠΕ18.02","ΔΙΟΙΚΗΣΗ ΕΠΙΧΕΙΡΗΣΕΩΝ"],
  ["ΠΕ18.03","ΛΟΓΙΣΤΙΚΗΣ"],
  ["ΠΕ18.04","ΑΙΣΘΗΤΙΚΗΣ"],
  ["ΠΕ18.05","ΚΟΜΜΩΤΙΚΗΣ"],
  ["ΠΕ18.06","ΚΟΠΤΙΚΗΣ - ΡΑΠΤΙΚΗΣ"],
  ["ΠΕ18.07","ΙΑΤΡΙΚΩΝ ΕΡΓΑΣΤΗΡΙΩΝ"],
  ["ΠΕ18.08","ΟΔΟΝΤΟΤΕΧΝΙΚΗΣ"],
  ["ΠΕ18.09","ΚΟΙΝΩΝΙΚΗΣ ΕΡΓΑΣΙΑΣ"],
  ["ΠΕ18.10","ΝΟΣΗΛΕΥΤΙΚΗΣ"],
  ["ΠΕ18.11","ΜΑΙΕΥΤΙΚΗΣ"],
  ["ΠΕ18.12","ΦΥΤΙΚΗΣ ΠΑΡΑΓΩΓΗΣ"],
  ["ΠΕ18.13","ΖΩΙΚΗΣ ΠΑΡΑΓΩΓΗΣ"],
  ["ΠΕ18.14","ΙΧΘΥΟΚΟΜΙΑΣ - ΑΛΙΕΙΑΣ"],
  ["ΠΕ18.15","ΓΕΩΡΓΙΚΩΝ ΜΗΧΑΝΩΝ & ΑΡΔΕΥΣΕΩΝ"],
  ["ΠΕ18.16","ΔΑΣΟΠΟΝΙΑΣ"],
  ["ΠΕ18.17","ΔΙΟΙΚΗΣΗ ΓΕΩΡΓΙΚΩΝ ΕΚΜΕΤΑΛ."],
  ["ΠΕ18.18","ΟΧΗΜΑΤΩΝ ΤΕΙ"],
  ["ΠΕ18.19","ΣΤΑΤΙΣΤΙΚΗΣ"],
  ["ΠΕ18.20","ΚΛΩΣΤΟΫΦΑΝΤΟΥΡΓΙΑΣ"],
  ["ΠΕ18.21","ΡΑΔΙΟΛΟΓΙΑΣ - ΑΚΤΙΝΟΛΟΓΙΑΣ"],
  ["ΠΕ18.22","ΜΕΤΑΛΛΕΙΟΛΟΓΟΙ - ΤΕΧΝ. ΟΡΥΧΕΙΩΝ - ΤΕΧΝ. ΓΕΩΤΕΧΝΟΛΟΓΙΑΣ & ΠΕΡΙΒΑΛΛΟΝΤΟΣ"],
  ["ΠΕ18.23","ΝΑΥΤ. ΜΑΘ. (ΠΛΟΙΑΡΧΟΙ)"],
  ["ΠΕ18.24","ΕΡΓΑΣΙΟΘΕΡΑΠΕΙΑΣ"],
  ["ΠΕ18.25","ΦΥΣΙΟΘΕΡΑΠΕΙΑΣ"],
  ["ΠΕ18.26","ΓΡΑΦΙΣΤΙΚΗΣ"],
  ["ΠΕ18.27","ΔΙΑΚΟΣΜΗΤΙΚΗΣ"],
  ["ΠΕ18.28","ΣΥΝΤΗΡΗΤΕΣ ΕΡΓΩΝ ΤΕΧΝΗΣ & ΑΡΧΑΙΟΛ. ΕΥΡΗΜΑΤΩΝ"],
  ["ΠΕ18.29","ΦΩΤΟΓΡΑΦΙΑΣ"],
  ["ΠΕ18.30","ΘΕΡΜΟΚΗΠΙΑΚΩΝ ΚΑΛΛΙΕΡΓΕΙΩΝ & ΑΝΘΟΚΟΜΙΑΣ"],
  ["ΠΕ18.31","ΜΗΧΑΝ. ΕΜΠΟΡΙΚΟΥ ΝΑΥΤΙΚΟΥ"],
  ["ΠΕ18.32","ΜΗΧΑΝΟΣΥΝΘ. ΑΕΡΟΣΚΑΦΩΝ"],
  ["ΠΕ18.33","ΒΡΕΦΟΝΗΠΙΟΚΟΜΩΝ"],
  ["ΠΕ18.34","ΑΡΓΥΡΟΧΡΥΣΟΧΟΪΑΣ"],
  ["ΠΕ18.35","ΤΟΥΡΙΣΤΙΚΩΝ ΕΠΙΧΕΙΡΗΣΕΩΝ"],
  ["ΠΕ18.36","ΤΕΧΝΟΛΟΓΟΙ ΤΡΟΦΙΜΩΝ - ΔΙΑΤΡΟΦΗΣ"],
  ["ΠΕ18.37","ΔΗΜΟΣΙΑΣ ΥΓΙΕΙΝΗΣ"],
  ["ΠΕ18.38","ΚΕΡΑΜΙΚΗΣ"],
  ["ΠΕ18.39","ΕΠΙΣΚΕΠΤΕΣ ΥΓΕΙΑΣ"],
  ["ΠΕ18.40","ΕΜΠΟΡΙΑΣ ΚΑΙ ΔΙΑΦΗΜΙΣΗΣ (marketing)"],
  ["ΠΕ18.44"," ΣΧΕΔΙΑΣΜΟΥ ΚΑΙ ΤΕΧΝΟΛΟΓΙΑΣ ΞΥΛΟΥ ΚΑΙ ΕΠΙΠΛΟΥ"],
  ["ΠΕ19","ΠΛΗΡΟΦΟΡΙΚΗΣ ΑΕΙ"],
  ["ΠΕ20","ΠΛΗΡΟΦΟΡΙΚΗΣ ΤΕΙ"],
  ["ΠΕ33", "ΜΕΘΟΔΟΛΟΓΙΑΣ ΙΣΤΟΡΙΑΣ & ΘΕΩΡΙΑΣ ΤΗΣ ΕΠΙΣΤΗΜΗΣ (Μ.Ι.Θ.Ε.)"],
  ["ΤΕ01","Όλοι/ές οι ΤΕ"],
  ["ΤΕ01.01","ΣΧΕΔΙΑΣΤΕΣ"],
  ["ΤΕ01.02","ΜΗΧΑΝΟΛΟΓΟΙ"],
  ["ΤΕ01.03","ΜΗΧΑΝ. ΑΥΤΟΚΙΝΗΤΩΝ"],
  ["ΤΕ01.04","ΨΥΚΤΙΚΟΙ"],
  ["ΤΕ01.05","ΔΟΜΙΚΟΙ"],
  ["ΤΕ01.06","ΗΛΕΚΤΡΟΛΟΓΟΙ"],
  ["ΤΕ01.07","ΗΛΕΚΤΡΟΝΙΚΟΙ"],
  ["ΤΕ01.08","ΧΗΜΙΚΟΙ ΕΡΓΑΣΤΗΡΙΩΝ"],
  ["ΤΕ01.09","ΜΗΧΑΝ. ΕΜΠΟΡΙΚΟΥ ΝΑΥΤΙΚΟΥ"],
  ["ΤΕ01.10","ΥΠΑΛΛΗΛΟΙ ΓΡΑΦΕΙΟΥ"],
  ["ΤΕ01.11","ΥΠΑΛΛΗΛΟΙ ΛΟΓΙΣΤΗΡΙΟΥ"],
  ["ΤΕ01.12","ΔΙΑΚΟΣΜΗΤΙΚΗΣ"],
  ["ΤΕ01.13","ΠΡΟΓΡΑΜΜΑΤΙΣΤΕΣ Η/Υ"],
  ["ΤΕ01.14","ΓΡΑΦΙΚΩΝ ΤΕΧΝΩΝ"],
  ["ΤΕ01.15","ΨΗΦΙΔΟΓΡΑΦΟΙ - ΥΑΛΟΓΡΑΦΟΙ"],
  ["ΤΕ01.17","ΣΥΝΤΥΡΗΤΕΣ ΕΡΓ. ΤΕΧΝΗΣ & ΑΡΧΑΙΟΛ. ΕΥΡΗΜΑΤΩΝ"],
  ["ΤΕ01.19","ΚΟΜΜΩΤΙΚΗΣ"],
  ["ΤΕ01.20","ΑΙΣΘΗΤΙΚΗΣ"],
  ["ΤΕ01.22","ΚΟΠΤΙΚΗΣ - ΡΑΠΤΙΚΗΣ"],
  ["ΤΕ01.23","ΜΕΤΑΛΛΕΙΟΛΟΓΟΙ"],
  ["ΤΕ01.24","ΩΡΟΛΟΓΟΠΟΙΪΑΣ"],
  ["ΤΕ01.25","ΑΡΓΥΡΟΧΡΥΣΟΧΟΪΑΣ"],
  ["ΤΕ01.26","ΟΔΟΝΤΟΤΕΧΝΙΤΕΣ"],
  ["ΤΕ01.27","ΚΛΩΣΤΟΫΦΑΝΤΟΥΡΓΙΑΣ"],
  ["ΤΕ01.28","ΜΗΧΑΝΟΣΥΝΘΕΤΕΣ ΑΕΡΟΣΚΑΦΩΝ"],
  ["ΤΕ01.29","ΒΟΗΘΩΝ ΙΑΤΡ. & ΒΙΟΛΟΓ. ΕΡΓΑΣΤΗΡΙΩΝ"],
  ["ΤΕ01.30","ΒΟΗΘΟΙ ΒΡΕΦΟΚΟΜΩΝ - ΠΑΙΔΟΚΟΜΩΝ"],
  ["ΤΕ01.31","ΧΕΙΡΙΣΤΕΣ ΙΑΤΡΙΚΩΝ ΣΥΣΚΕΥΩΝ (ΒΟΗΘΟΙ ΑΚΤΙΝ.)"],
  ["ΤΕ01.32","ΑΝΘΟΚΟΜΙΑΣ - ΚΗΠΟΤΕΧΝΙΑΣ"],
  ["ΤΕ01.33","ΦΥΤΙΚΗΣ ΠΑΡΑΓΩΓΗΣ"],
  ["ΤΕ01.34","ΖΩΪΚΗΣ ΠΑΡΑΓΩΓΗΣ"],
  ["ΤΕ01.35","ΓΕΩΡΓΙΚΩΝ ΜΗΧΑΝΗΜΑΤΩΝ"],
  ["ΤΕ01.36","ΑΓΡΟΤΙΚΩΝ ΣΥΝ/ΜΩΝ & ΕΚΜΕΤΑΛΛΕΥΣΕΩΝ"],
  ["ΤΕ16","ΜΟΥΣΙΚΗΣ ΜΗ ΑΝΩΤΑΤΩΝ ΙΔΡΥΜΑΤΩΝ ΑΛΛΟΔΑΠΗΣ"],
]

specialties.each do |k, v|
    begin
      Specialty.create( code: k, description: v )
      puts "#{k}: #{v} inserted"
    rescue ActiveRecord::RecordNotUnique => e
      puts "#{k}: already exists"
    end
end

puts "All done"

