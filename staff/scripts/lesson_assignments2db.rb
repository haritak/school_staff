#!../bin/rails runner 
#
#run this script with:
#bin/rails runner path/to/filename.rb
#
#
#
reference =  "29071 9 Αυγούστου 2017 ΤΕΥΧΟΣ ΔΕΥΤΕΡΟ Αρ. Φύλλου 2797"

lesson_assignments = 
  [
    [ ["Α", "Νέα Ελληνικά"], ["ΠΕ02"], [] , []],
    [ ["Α", "Άλγεβρα"], ["ΠΕ03"], [], 
      ["ΠΕ04.01", 
       "ΠΕ19", "ΠΕ20", 
       "ΠΕ12.01", "ΠΕ12.03", "ΠΕ12.04", "ΠΕ12.05", "ΠΕ12.06", "ΠΕ12.07", "ΠΕ12.08", "ΠΕ12.10", 
       "ΠΕ17.01", "ΠΕ17.02", "ΠΕ17.03", "ΠΕ17.04"
]],
[["Α", "Γεωμετρία"], ["ΠΕ03"], [], 
 ["ΠΕ04.01", 
  "ΠΕ19", "ΠΕ20", 
  "ΠΕ12.01", "ΠΕ12.03", "ΠΕ12.04", "ΠΕ12.05", "ΠΕ12.06", "ΠΕ12.07", "ΠΕ12.08", "ΠΕ12.10", 
  "ΠΕ17.01", "ΠΕ17.02", "ΠΕ17.03", "ΠΕ17.04"
]],
[["Α", "Φυσική"], ["ΠΕ04.01", "ΠΕ12.10"], 
 ["ΠΕ04.02", "ΠΕ04.03", "ΠΕ04.04", "ΠΕ04.05", "ΠΕ12.08"], 
 [ "ΠΕ12.01", "ΠΕ12.03", "ΠΕ12.04", "ΠΕ12.05", "ΠΕ12.06", "ΠΕ12.07"]],
[["Α", "Χημεία"], ["ΠΕ04.02", "ΠΕ12.08"], 
 ["ΠΕ04.01", "ΠΕ04.03", "ΠΕ04.04", "ΠΕ04.05", "ΠΕ14.01", "ΠΕ14.02", "ΠΕ14.03", "ΠΕ14.04"], 
 []],
[["Α", "Βιολογία", ],["ΠΕ04.04", "ΠΕ04.03"], 
 ["ΠΕ04.01", "ΠΕ04.02", "ΠΕ04.05", 
  "ΠΕ14.01", "ΠΕ14.02", "ΠΕ14.03", "ΠΕ14.04", "ΠΕ14.06", 
  "ΠΕ18.07", "ΠΕ18.10", "ΠΕ18.11"], 
  []],

[["Α", "Πολιτική Παιδεία", ],["ΠΕ09", "ΠΕ10", "ΠΕ13"], ["ΠΕ02"], []],
[["Α", "Ιστορία", ],["ΠΕ02", "ΠΕ33"], ["ΠΕ05", "ΠΕ06", "ΠΕ07", "ΠΕ10", "ΠΕ13"], []],
[["Α", "Θρησκευτικά", ],["ΠΕ01"]],
[["Α", "Αγγλικά", ],["ΠΕ06"]],
[["Α", "Φυσική Αγωγή", ],["ΠΕ11"]],
[["Α", "Πληροφορική", ],["ΠΕ19", "ΠΕ20"]],


[["Α", "Ερευνητική Εργασία στην Τεχνολογία", ], ["ΠΕ12.*", "ΠΕ14.*", "ΠΕ17.*", "ΠΕ18.*"], [], []],
[["Α", "Ζώνη Δημιουργικών Δραστηριοτήτων", ], ["ΠΕ*"], [], []],
[["Α", "Σχολικός Επαγγελματικός Προσανατολισμός",  ], ["ΠΕ*"], [], []],

[["ΑΕ", "Αγωγή Υγείας", ], [
  "ΠΕ14.01", "ΠΕ14.02", "ΠΕ14.03", "ΠΕ14.06",
  "ΠΕ18.04", "ΠΕ18.07", "ΠΕ18.08", "ΠΕ18.09", 
  "ΠΕ18.10", "ΠΕ18.11", "ΠΕ18.21", "ΠΕ18.24", 
  "ΠΕ18.25", "ΠΕ18.33", "ΠΕ18.37", "ΠΕ18.39"
], [], []
],

[["ΑΕ", "Αρχές Γραμμικού και Αρχιτεκτονικού Σχεδίου", ], [
  "ΠΕ12.01", "ΠΕ12.02", "ΠΕ12.03",
  "ΠΕ17.01", "ΠΕ17.05", "ΠΕ17.11"
], [], []
],

[["ΑΕ", "Αρχές Ηλεκτρολογίας και Ηλεκτρονικής", ], [
  "ΠΕ12.05", "ΠΕ12.06", "ΠΕ12.10",
  "ΠΕ17.03", "ΠΕ17.04", "ΠΕ17.07", "ΠΕ17.08", "ΠΕ17.09"
], [], []
],

[["ΑΕ", "Αρχές Μηχανολογίας", ], [
  "ΠΕ12.04", "ΠΕ12.07",
  "ΠΕ17.02", "ΠΕ17.06",
  "ΠΕ18.15", "ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32"
], [], []
],


[["ΑΕ", "Αρχές Οικονομίας", ], [
  "ΠΕ09",
  "ΠΕ18.02", "ΠΕ18.03", "ΠΕ18.35", "ΠΕ18.40"
], ["ΠΕ10", "ΠΕ13"], []
],


[["ΑΕ", "Βασικές Αρχές Σύνθεσης", ], [
  "ΠΕ08", "ΠΕ12.02",
  "ΠΕ18.01", "ΠΕ18.26", "ΠΕ18.27", "ΠΕ18.28", "ΠΕ18.29", "ΠΕ18.34"
], ["ΠΕ18.06","ΠΕ18.20","ΠΕ18.38","ΠΕ18.44"], []
],


[["ΑΕ", "Γεωπονία και Αειφόρος Ανάπτυξη", ], [
  "ΠΕ14.04", "ΠΕ14.05",
  "ΠΕ18.12", "ΠΕ18.13", "ΠΕ18.14", "ΠΕ18.15", "ΠΕ18.16", 
  "ΠΕ18.17", "ΠΕ18.30", "ΠΕ18.36"
], [], []
],

[["ΑΕ", "Ναυτική Τέχνη", ], [
  "ΠΕ18.23", "ΠΕ18.31"
], [], []
],


[["Β", "Νέα Ελληνικά", ], ["ΠΕ02"], [] , []],
[["Β", "Άλγεβρα", ], ["ΠΕ03"],[],[]],
[["Β", "Γεωμετρία", ], ["ΠΕ03"],[],[]],
[["Β", "Φυσική", ], ["ΠΕ04.01", "ΠΕ12.10"], 
 ["ΠΕ04.02", "ΠΕ04.03", "ΠΕ04.04", "ΠΕ04.05", "ΠΕ12.08"], 
 []],
[["Β", "Χημεία", ], ["ΠΕ04.02", "ΠΕ12.08"], 
 ["ΠΕ04.01", "ΠΕ04.03", "ΠΕ04.04", "ΠΕ04.05", 
  "ΠΕ14.01", "ΠΕ14.02", "ΠΕ14.03", "ΠΕ14.04"], 
  []],
[["Β", "Εισαγωγή στις Αρχές της Επιστήμης των Η/Υ", ], ["ΠΕ19", "ΠΕ20"]],
[["Β", "Θρησκευτικά", ], ["ΠΕ01"]],
[["Β", "Αγγλικά", ], ["ΠΕ06"]],
[["Β", "Φυσική Αγωγή", ], ["ΠΕ11"]],

[["ΒΓ", "Αρχές Αγροτικής Ανάπτυξης" , 
], [ "ΠΕ14.04", "ΠΕ14.05", "ΠΕ18.12","ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
[],[]
],

[["ΒΓ", "Περιβάλλον και Γεωργία",
], ["ΠΕ14.04", "ΠΕ14.05", 
    "ΠΕ18.12","ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36", 
    "ΤΕ01.32","ΤΕ01.33","ΤΕ01.34","ΤΕ01.36"],
    [],[]
],
[["ΒΓ", "Φυτική Παραγωγή",
], ["ΠΕ14.04", "ΠΕ18.12", "ΤΕ01.33"],
["ΠΕ14.05", "ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
[]
],
[["ΒΓ", "Ζωική Παραγωγή",
], ["ΠΕ14.04", "ΠΕ18.13", "ΤΕ01.34"],
["ΠΕ14.05", "ΠΕ18.12","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
[]
],
[["ΒΓ", "Τεχνολογία Τροφίμων",
], ["ΠΕ14.04", "ΠΕ18.36"],
["ΠΕ18.12","ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30"],
[]
],
[["ΒΓ", "Στοιχεία Γεωργικών Εγκαταστάσεων και Γεωργικά Μηχανήματα",
], ["ΠΕ14.04", "ΠΕ18.15", "ΤΕ01.35"],
["ΠΕ14.05", "ΠΕ18.12","ΠΕ18.13","ΠΕ18.14","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
[]
],
[["ΒΓ", "Αρχές Αρχιτεκτονικής Τοπίου",
], ["ΠΕ14.04", "ΠΕ14.05", "ΠΕ18.16","ΠΕ18.30", "ΤΕ01.32"],
["ΠΕ14.05", "ΠΕ18.12","ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.17","ΠΕ18.36"],
[]
],
[["ΒΓ", "Αγγλικά Τομέα",
], ["ΠΕ06"],
[],
[]
],

[["ΒΟΙΚ", "Αρχές Λογιστικής",
], ["ΠΕ09",
    "ΠΕ18.02", "ΠΕ18.03", "ΠΕ18.35", "ΠΕ18.40",
    "ΤΕ01.10", "ΤΕ01.11"],
    [],
    []
],
[["ΒΟΙΚ", "Εισαγωγή στο Μάρκετινγκ",
], ["ΠΕ09", "ΠΕ18.02", "ΠΕ18.03", "ΠΕ18.35", "ΠΕ18.40", ],
[],
[]
],
[["ΒΟΙΚ", "Θεωρία Τουρισμού και Εφαρμογές", "Ε"
], ["ΠΕ09", "ΠΕ18.35"],
["ΠΕ10", "ΠΕ13", "ΠΕ18.02","ΠΕ18.03","ΠΕ18.40",
 "ΤΕ01.10", "ΤΕ01.11"],
 []
],
[["ΒΟΙΚ", "Εισαγωγή στην Εφοδιαστική",
], ["ΠΕ09", "ΠΕ12.11", "ΠΕ18.02", "ΠΕ18.03", "ΠΕ18.35", "ΠΕ18.40", ],
[],
[]
],
[["ΒΟΙΚ", "Χρηματοπιστωτικές Συναλλαγές-Λογιστικά Φύλλα", "Ε"
], ["ΠΕ09", "ΠΕ18.02", "ΠΕ18.03", "ΠΕ18.35", "ΠΕ18.40", "ΤΕ01.10", "ΤΕ01.11"],
[],
[]
],
[["ΒΟΙΚ", "Στοιχεία Δικαίου",
], ["ΠΕ13"],
["ΠΕ09", "ΠΕ10", "ΠΕ18.02", "ΠΕ18.03", "ΠΕ18.35", "ΠΕ18.40",],
[]
],
[["ΒΟΙΚ", "Οικονομικά Μαθηματικά και Στατιστική",
], ["ΠΕ03", "ΠΕ09", "ΠΕ18.02", "ΠΕ18.03", "ΠΕ18.35", "ΠΕ18.40", ],
[],
[]
],
[["ΒΟΙΚ", "Αγγλικά Τομέα",
], ["ΠΕ06"],
[],
[]
],

[["ΒΗ", "Ηλεκτροτεχνία (Κυκλώματα Συνεχούς και Εναλλασσόμενου Ρεύματος)",
], ["ΠΕ12.05","ΠΕ12.06","ΠΕ12.10",
    "ΠΕ17.03","ΠΕ17.07","ΠΕ17.04","ΠΕ17.08","ΠΕ17.09",
    "ΤΕ01.06","ΤΕ01.07"],
    [],
    []
],
[["ΒΗ", "Εσωτερικές Ηλεκτρικές Εγκαταστάσεις και Ηλεκτρολογικό Σχέδιο", 
], ["ΠΕ12.05",
    "ΠΕ17.03","ΠΕ17.07",
    "ΤΕ01.06"],
    ["ΠΕ12.06","ΠΕ12.10",
     "ΠΕ17.04","ΠΕ17.08","ΠΕ17.09",
     "ΤΕ01.07"],
     []
],
[["ΒΗ", "Εισαγωγή στα Υπολογιστικά Συστήματα και στα Δίκτυα Επικοινωνιών", "Ε"
], ["ΠΕ12.06","ΠΕ12.10",
    "ΠΕ17.04","ΠΕ17.08","ΠΕ17.09",
    "ΤΕ01.07"],
    ["ΠΕ12.05",
     "ΠΕ17.03","ΠΕ17.07",
     "ΠΕ19", "ΠΕ20",
     "ΤΕ01.06"],
],
[["ΒΗ", "Αυτοματισμοί-Αισθητήρες", "Ε"
], ["ΠΕ12.05",
    "ΠΕ17.03","ΠΕ17.07",
    "ΤΕ01.06"],
    ["ΠΕ12.06","ΠΕ12.10",
     "ΠΕ17.04","ΠΕ17.08","ΠΕ17.09",
     "ΤΕ01.07"],
     []
],
[["ΒΗ", "Αναλογικά και Ψηφιακά Ηλεκτρονικά", 
], ["ΠΕ12.06","ΠΕ12.10",
    "ΠΕ17.04","ΠΕ17.08","ΠΕ17.09",
    "ΤΕ01.07"],
    ["ΠΕ12.05",
     "ΠΕ17.03","ΠΕ17.07",
     "ΤΕ01.06"],
],
[["ΒΗ", "Αγγλικά Τομέα", 
], ["ΠΕ06"],
[],
[]
],

[["ΒΜ", "Στοιχεία Τεχνικής Θερμοδυναμικής - Εφαρμογές",
], ["ΠΕ12.04", "ΠΕ12.07", "ΠΕ12.08", "ΠΕ12.11",
    "ΠΕ17.02", "ΠΕ17.06", "ΠΕ17.12",
    "ΠΕ18.15", "ΠΕ18.18", "ΠΕ18.22", "ΠΕ18.31", "ΠΕ18.32",
    "ΤΕ01.02", "ΤΕ01.03", "ΤΕ01.04", "ΤΕ01.09", "ΤΕ01.28"],
    [],
    []
],
[["ΒΜ", "Μηχανική Αντοχή Υλικών",
], ["ΠΕ12.01", "ΠΕ12.02", "ΠΕ12.04", "ΠΕ12.07","ΠΕ12.08","ΠΕ12.11",
    "ΠΕ17.01", "ΠΕ17.02", "ΠΕ17.05", "ΠΕ17.06", "ΠΕ17.12",
    "ΠΕ18.15","ΠΕ18.18", "ΠΕ18.22", "ΠΕ18.31", "ΠΕ18.32" ],
    [],
    []
],
[["ΒΜ", "Σχεδιασμός και Περιγραφή Στοιχείων Μηχανών", "Ε"
], ["ΠΕ12.04", "ΠΕ12.07", "ΠΕ12.11",
    "ΠΕ17.02", "ΠΕ17.06", "ΠΕ17.12",
    "ΠΕ18.15", "ΠΕ18.18", "ΠΕ18.22", "ΠΕ18.31", "ΠΕ18.32",
    "ΤΕ01.02"],
    ["ΤΕ01.03", "ΤΕ01.09", "ΤΕ01.28"],
    []
],
[["ΒΜ", "Τεχνολογία Μηχανολογικών Κατασκευών - Εφαρμογές",
], ["ΠΕ12.04", "ΠΕ12.07", "ΠΕ12.11",
    "ΠΕ17.02", "ΠΕ17.06", "ΠΕ17.12",
    "ΠΕ18.15", "ΠΕ18.18", "ΠΕ18.22", "ΠΕ18.31", "ΠΕ18.32",
    "ΤΕ01.02","ΤΕ01.03", "ΤΕ01.09", "ΤΕ01.28"],
    ["ΤΕ01.04"],
    []
],
[["ΒΜ", "Βασική Ηλεκτρολογία και Εφαρμογές",
], ["ΠΕ12.05", "ΠΕ12.06", "ΠΕ12.10",
    "ΠΕ17.03", "ΠΕ17.04", "ΠΕ17.07", "ΠΕ17.08", "ΠΕ17.09",
    "ΤΕ01.06", "ΤΕ01.07"],
    [],
    []
],
[["ΒΜ", "Αγγλικά Τομέα",
], ["ΠΕ06"],
[],
[]
],
[["ΒΠ", "Αρχές Προγραμματισμού Υπολογιστών",
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08"],
[]
],
[["ΒΠ", "Υλικό και Δίκτυα Υπολογιστών",
], ["ΠΕ19", "ΠΕ20",],
["ΤΕ01.13", "ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08"],
[]
],
[["ΒΠ", "Βασικά Θέματα Πληροφορικής",
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08"],
[]
],
[["ΒΠ", "Λειτουργικά Συστήματα και Ασφάλεια Πληροφοριακών Συστημάτων",
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
[],
[]
],
[["ΒΠ", "Σχεδιασμός και Ανάπτυξη Ιστοτόπων", "Ε"
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
[],
[]
],
[["ΒΠ", "Τεχνικά Θέματα Πωλήσεων και Προδιαγραφών Υλικού και Λογισμικού",
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
[],
[]
],
[["ΒΠ", "Αγγλικά Τομέα",
], ["ΠΕ06"],
[],
[]
],
[["ΒΥ", "Ανατομία - Φυσιολογία",
], ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
    "ΠΕ18.04","ΠΕ18.07","ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.24","ΠΕ18.25","ΠΕ18.39"],
    ["ΠΕ18.08","ΠΕ18.09","ΠΕ18.33","ΠΕ18.37"],
    []
],
[["ΒΥ", "Πρώτες Βοήθειες", "Ε"
], ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
    "ΠΕ18.04","ΠΕ18.07","ΠΕ18.08","ΠΕ18.09","ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.24","ΠΕ18.25",
    "ΠΕ18.33", "ΠΕ18.37", "ΠΕ18.39"],
    [],
    []
],
[["ΒΥ", "Υγιεινή",
], ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
    "ΠΕ18.04","ΠΕ18.07","ΠΕ18.08","ΠΕ18.09","ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.24","ΠΕ18.25",
    "ΠΕ18.33", "ΠΕ18.37", "ΠΕ18.39"],
    [],
    []
],
[["ΒΥ", "Διαπροσωπικές Σχέσεις",
], ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
    "ΠΕ18.04","ΠΕ18.07","ΠΕ18.08","ΠΕ18.09","ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.24","ΠΕ18.25",
    "ΠΕ18.33", "ΠΕ18.37", "ΠΕ18.39"],
    [],
    []
],
[["ΒΥ", "Εργασιακό Περιβάλλον Τομέα", "Ε",
], ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
    "ΠΕ18.04","ΠΕ18.07","ΠΕ18.08","ΠΕ18.09","ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.24","ΠΕ18.25",
    "ΠΕ18.33", "ΠΕ18.37", "ΠΕ18.39"],
    [],
    []
],
[["ΒΥ", "Αγγλικά Τομέα",
], ["ΠΕ06"],
[],
[]
],
[["ΒΥ", "Νοσηλευτική",
], ["ΠΕ14.06", "ΠΕ18.10", "ΠΕ18.11"],
[ "ΠΕ14.01", "ΠΕ18.39" ],
[]
],
[["ΒΥ", "Μικροβιολογία", "Θ",
], ["ΠΕ14.01", "ΠΕ18.07", "ΤΕ01.29"],
[ "ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
  "ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.37","ΠΕ18.39"],
  [],
],
[["ΒΥ", "Μικροβιολογία", "Ε",
], ["ΠΕ18.07", "ΤΕ01.29"],
[ "ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
  "ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.37","ΠΕ18.39"],
  [],
],
[["Γ", "Νέα Ελληνικά", ], ["ΠΕ02"], [] , []],
[["Γ", "Άλγεβρα", ], ["ΠΕ03"],[],[]],
[["Γ", "Γεωμετρία", ], ["ΠΕ03"],[],[]],
[["Γ", "Φυσική", ], ["ΠΕ04.01", "ΠΕ12.10"], 
 ["ΠΕ04.02", "ΠΕ04.03", "ΠΕ04.04", "ΠΕ04.05", "ΠΕ12.08"], 
 []],
[["Γ", "Χημεία", ], ["ΠΕ04.02", "ΠΕ12.08"], 
 ["ΠΕ04.01", "ΠΕ04.03", "ΠΕ04.04", "ΠΕ04.05", 
  "ΠΕ14.01", "ΠΕ14.02", "ΠΕ14.03", "ΠΕ14.04"], 
  []],
[["Γ", "Εισαγωγή στις Αρχές της Επιστήμης των Η/Υ", ], ["ΠΕ19", "ΠΕ20"]],
[["Γ", "Αγγλικά", ], ["ΠΕ06"]],
[["Γ", "Φυσική Αγωγή", ], ["ΠΕ11"]],
[["ΓΠ", "Προγραμματισμός Υπολογιστών",
], ["ΠΕ19", "ΠΕ20"],
[],
[]
],
[["ΓΠ", "Προγραμματισμός Υπολογιστών", "Ε",
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
[],
[]
],
[["ΓΠ", "Δίκτυα Υπολογιστών",
], ["ΠΕ19", "ΠΕ20"],
["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08"],
[]
],
[["ΓΠ", "Δίκτυα Υπολογιστών", "Ε",
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08"],
[]
],
[["ΓΠ", "Πληροφοριακά Συστήματα σε Επιχειρήσεις και Οργανισμούς",
], ["ΠΕ19", "ΠΕ20"],
[],
[]
],
[["ΓΠ", "Συστήματα Διαχείρισης Βάσεων Δεδομένων και Εφαρμογές στο Διαδίκτυο", "Ε"
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
[],
[]
],
[["ΓΠ", "Ειδικά Θέματα στον Προγραμματισμό Υπολογιστών", "Ε"
], ["ΠΕ19", "ΠΕ20"],
[],
[]
],
[["ΓΠ", "Σχεδιασμός και Ανάπτυξη Διαδικτυακών Εφαρμογών", "Ε"
], ["ΠΕ19", "ΠΕ20", "ΤΕ01.13"],
["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08"],
[]
],
[["ΓΜΚ", "Στοιχεία Μηχανών",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11", "ΠΕ17.02", "ΠΕ17.06", "ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32"],
[],
[]
],
[["ΓΜΚ", "Στοιχεία Σχεδιασμού Κεντρικών Θερμάνσεων",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11", "ΠΕ17.02", "ΠΕ17.06" ],
["ΠΕ17.12", "ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32", "ΤΕ01.02"],
[]
],
[["ΓΜΚ", "Μηχανουργική Τεχνολογία - Εργαλειομηχανές",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11","ΠΕ17.12", "ΠΕ17.02", "ΠΕ17.06", "ΤΕ01.02" ],
["ΠΕ18.15", "ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32", 
 "ΤΕ01.03", "ΤΕ01.04", "ΤΕ01.09", "ΤΕ01.28"],
 [],
],
[["ΓΜΚ", "Ανελκυστήρες - Ανυψωτικές Μηχανές ",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11", "ΠΕ17.02", "ΠΕ17.06", "ΠΕ17.12", "ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32"],
["ΠΕ12.05", "ΠΕ12.06",
 "ΠΕ17.03", "ΠΕ17.04", "ΠΕ17.07", "ΠΕ17.08", "ΠΕ18.15"],
 []
],
[["ΓΜΚ", "Στοιχεία Ψύξης - Κλιματισμού",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11", "ΠΕ17.02", "ΠΕ17.06", "ΤΕ01.04" ],
["ΠΕ17.12", "ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32", "ΤΕ01.02"],
[]
],
[["ΓΟΧ", "Στοιχεία Μηχανών",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11",
    "ΠΕ17.02", "ΠΕ17.06",
    "ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32"],
    [],
    []
],
[["ΓΟΧ", "Μηχανές Εσωτερικής Καύσης ΙΙ", "Θ",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11",
    "ΠΕ17.02", "ΠΕ17.06",
    "ΠΕ18.15","ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32",
    "ΤΕ01.02", "ΤΕ01.03",
],
[],
[]
],
[["ΓΟΧ", "Μηχανές Εσωτερικής Καύσης ΙΙ", "Ε",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11",
    "ΠΕ17.02", "ΠΕ17.06",
    "ΠΕ18.15","ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32",
    "ΤΕ01.02", "ΤΕ01.03", "ΤΕ01.28"
],
[],
[]
],
[["ΓΟΧ", "Συστήματα Αυτοκινήτου",
], ["ΠΕ12.04", "ΠΕ12.07","ΠΕ12.11",
    "ΠΕ17.02", "ΠΕ17.06",
    "ΠΕ18.15","ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32",
    "ΤΕ01.02", "ΤΕ01.03",
],
[],
[]
],
[["ΓΟΧ", "Τεχνολογία Ελέγχων και Διαγνώσεων",
], ["ΠΕ12.04", "ΠΕ12.05", "ΠΕ12.06","ΠΕ12.10",
    "ΠΕ17.02", "ΠΕ17.03", "ΠΕ17.04", "ΠΕ17.06", "ΠΕ17.07", "ΠΕ17.08", "ΠΕ17.09",
    "ΠΕ18.15","ΠΕ18.18", "ΠΕ18.31", "ΠΕ18.32",
    "ΤΕ01.03",
],
["ΤΕ01.02", "ΤΕ01.06", "ΤΕ01.07"],
[]
],
[["ΓΗΝ", "Ψηφιακά Συστήματα"],
 ["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08", "ΠΕ17.09"],
 ["ΠΕ12.05", "ΠΕ17.03", "ΠΕ17.07"],
 []
],
[["ΓΗΝ", "Δίκτυα Υπολογιστών"],
 ["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08"],
 ["ΠΕ19", "ΠΕ20"],
 []
],
[["ΓΗΝ", "Εφαρμοσμένα Ηλεκτρονικά - Κατασκευές", "Ε"],
 ["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08", "ΠΕ17.09", "ΤΕ01.07"],
 [],
 []
],
[["ΓΗΝ", "Εγκατάσταση και Διαχείριση Δικτύων - Συντήρηση Υπολογιστικών Συστημάτων", "Ε"],
 ["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08", "ΠΕ17.09"],
 ["ΠΕ19", "ΠΕ20"],
 []
],
[["ΓΗΝ", "Συστήματα Ελέγχου και Ασφάλειας", "Ε"],
 ["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08", "ΠΕ17.09", "ΤΕ01.07"],
 ["ΠΕ12.05", "ΠΕ17.03", "ΠΕ17.07", "ΤΕ01.06"],
 []
],
[["ΓΗΝ", "Τηλεπικοινωνίες - Τηλεματική"],
 ["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08", "ΠΕ17.09", "ΤΕ01.07"],
 [],
 []
],
[["ΓΗΝ", "Ρομποτική", "Ε"],
 ["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08", "ΠΕ17.09"],
 ["ΠΕ19", "ΠΕ20"],
 []
],
[["ΓΗΝ", "Επεξεργασία Σήματος Ήχου και Εικόνας", "Ε"],
 ["ΠΕ12.06", "ΠΕ12.10", "ΠΕ17.04", "ΠΕ17.08", "ΠΕ17.09", "ΤΕ01.07"],
 [],
 []
],
[["ΓΟΙΚ", "Αρχές Οικονομικής Θεωρίας"],
 ["ΠΕ09"],
 ["ΠΕ10", "ΠΕ13", "ΠΕ18.02","ΠΕ18.03","ΠΕ18.35","ΠΕ18.40"],
 []
],
[["ΓΟΙΚ", "Αρχές Οργάνωσης και Διοίκησης"],
 ["ΠΕ09", "ΠΕ18.02"],
 ["ΠΕ13", "ΠΕ18.03","ΠΕ18.35","ΠΕ18.40"],
 []
],
[["ΓΟΙΚ", "Σύγχρονο Περιβάλλον Γραφείου"],
 ["ΠΕ09", "ΠΕ18.02","ΠΕ18.03","ΠΕ18.35","ΠΕ18.40"],
 ["ΠΕ13", "ΤΕ01.10", "ΤΕ01.11"],
 []
],
[["ΓΟΙΚ", "Φορολογική Πρακτική"],
 ["ΠΕ09", "ΠΕ18.03", "ΤΕ01.10", "ΤΕ01.11"],
 ["ΠΕ13", "ΠΕ18.02","ΠΕ18.35","ΠΕ18.40"],
 []
],
[["ΓΟΙΚ", "Λογιστικές Εφαρμογές", "Ε"],
 ["ΠΕ09", "ΠΕ18.03", "ΤΕ01.10", "ΤΕ01.11"],
 ["ΠΕ18.02","ΠΕ18.35","ΠΕ18.40"],
 []
],
[["ΓΟΙΚ", "Επικοινωνία και Δημόσιες Σχέσεις"],
 ["ΠΕ09", "ΠΕ10", "ΠΕ13", "ΠΕ18.02","ΠΕ18.40"],
 ["ΠΕ18.03","ΠΕ18.35"],
 []
],
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
[["ΓΦΠ", "Φυτά Μεγάλης Καλλιέργειας"],
 ["ΠΕ14.04",
  "ΠΕ18.12","ΤΕ01.33"],
  ["ΠΕ14.05",
   "ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
   []
],
[["ΓΦΠ", "Κηπευτικές Καλλιέργειες - Αρδεύσεις"],
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
[["ΓΤΤ", "Σύγχρονες Γεωργικές Επιχειρήσεις"],
 ["ΠΕ14.04","ΠΕ14.05",
  "ΠΕ18.12","ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30","ΠΕ18.36"],
  [],
  []
],
[["ΓΤΤ", "Αρχές Βιολογικής Γεωργίας"],
 ["ΠΕ14.04",
  "ΠΕ18.12","ΠΕ18.13","ΠΕ18.30","ΠΕ18.36"],
  ["ΠΕ14.05",
   "ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17"],
   []
],
[["ΓΤΤ", "Αρχές Επεξεργασίας Τροφίμων"],
 ["ΠΕ14.04",
  "ΠΕ18.36"],
  ["ΠΕ14.05",
   "ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17", "ΠΕ18.30"],
   []
],
[["ΓΤΤ", "Μεταποίηση Φυτικών Προϊόντων"],
 ["ΠΕ14.04",
  "ΠΕ18.12", "ΠΕ18.36",
  "ΤΕ01.32"],
  ["ΠΕ14.05",
   "ΠΕ18.13","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30"],
   []
],
[["ΓΤΤ", "Μεταποίηση Ζωικών Προϊόντων"],
 ["ΠΕ14.04",
  "ΠΕ18.13", "ΠΕ18.36",
  "ΤΕ01.34"],
  ["ΠΕ14.05",
   "ΠΕ18.12","ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17","ΠΕ18.30"],
   []
],
[["ΓΤΤ", "Ασφάλεια Τροφίμων"],
 ["ΠΕ14.04",
  "ΠΕ18.36"],
  ["ΠΕ14.05",
   "ΠΕ18.14","ΠΕ18.15","ΠΕ18.16","ΠΕ18.17", "ΠΕ18.30"],
   []
],
[["ΓΥ", "Ανατομία-Φυσιολογία II"],
 ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
   "ΠΕ18.04","ΠΕ18.07","ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.24", "ΠΕ18.25","ΠΕ18.39"],
   ["ΠΕ18.08","ΠΕ18.09","ΠΕ18.33","ΠΕ18.37"],
   []
],
[["ΓΥ", "Υγιεινή"],
 ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.03","ΠΕ14.06",
   "ΠΕ18.04","ΠΕ18.07","ΠΕ18.08","ΠΕ18.09","ΠΕ18.10","ΠΕ18.11","ΠΕ18.21","ΠΕ18.24", "ΠΕ18.25",
   "ΠΕ18.33","ΠΕ18.37","ΠΕ18.39"],
   [],
   []
],
[["ΓΥ", "Νοσηλευτική ΙΙ"],
 ["ΠΕ14.06", "ΠΕ18.10", "ΠΕ18.11" ],
 ["ΠΕ14.01","ΠΕ18.39" ],
 []
],
[["ΓΥ", "Στοιχεία Παθολογίας"],
 ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.06",
   "ΠΕ18.10"],
   ["ΠΕ14.03","ΠΕ18.11","ΠΕ18.39" ],
   []
],
[["ΓΥ", "Χειρουργική - Τεχνική Χειρουργείου", "Ε"],
 ["ΠΕ14.01","ΠΕ14.02","ΠΕ14.06",
   "ΠΕ18.10", "ΠΕ18.11"],
   ["ΠΕ18.39" ],
   []
],
[["ΓΥ", "Στοιχεία Μαιευτικής - Γυναικολογίας"],
 ["ΠΕ14.01","ΠΕ14.06",
   "ΠΕ18.10", "ΠΕ18.11"],
   ["ΠΕ18.39" ],
   []
],
]

def get_lesson_type(lesson)
  lesson_type = "Θ"
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

  raise "Not found lesson type #{lesson}, #{lesson_type}" if not LessonType.find_by( code: lesson_type )
end

puts "Checking lessons" 
lesson_assignments.each do |la|
  lesson = la[0]
  lesson_type = get_lesson_type( lesson )
  lesson_type = LessonType.find_by( code: lesson_type )
  school_grade_specialty = SchoolGradeSpecialty.find_by( code: lesson[0] )
  theLesson = Lesson.find_by( lesson_type: lesson_type, 
                          school_grade_specialty: school_grade_specialty,
                          description: lesson[1])
  raise "Not found lesson #{lesson[1]}, #{lesson_type.code}, #{school_grade_specialty.code}" if not theLesson
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
  lesson_type = LessonType.find_by( code: lesson_type )
  school_grade_specialty = SchoolGradeSpecialty.find_by( code: lesson[0] )
  theLesson = Lesson.find_by( lesson_type: lesson_type, 
                          school_grade_specialty: school_grade_specialty,
                          description: lesson[1])
  raise "Not found lesson #{lesson[1]}, #{lesson_type.code}, #{school_grade_specialty.code}" if not theLesson
end


