#!bin/rails runner

filename = $ARGV[0]

not_found = []
File.open( filename ).each do |line|
  puts line
  parts = line.split(",")
  first_name = parts[2]
  last_name = parts[1]
  father_name = parts[3]

  person = Person.find_by( 
                          first_name: first_name,
                          last_name: last_name, )

  not_found << line if not person
  next if not person 

  email = parts[4] + " " + parts[5]
  address1 = parts[6] + " " + parts[7]
  address2 = parts[8] + " " +parts[9]
  phone = parts[10] + " " +parts[11] + " " + parts[12]

  puts email if email.strip! != ''
  puts address1 if address1.strip! != ''
  puts address2 if address2.strip! != ''
  puts phone if phone.strip! != ''
end

puts "The following persons where not found :"
not_found.each do |line|
  puts line
end
puts "end."
puts "Handle the above and hit enter to start updating the database"
$stdin.gets

File.open( filename ).each do |line|
  puts line
  parts = line.split(",")
  first_name = parts[2]
  last_name = parts[1]
  father_name = parts[3]

  person = Person.find_by( 
                          first_name: first_name,
                          last_name: last_name, )

  not_found << line if not person
  next if not person 

  email = parts[4] + " " + parts[5]
  address1 = parts[6] + " " + parts[7]
  address2 = parts[8] + " " +parts[9]
  phone = parts[10] + " " +parts[11] + " " + parts[12]

  puts email if email.strip! != ''
  puts address1 if address1.strip! != ''
  puts address2 if address2.strip! != ''
  puts phone if phone.strip! != ''

  person.update( father_name: father_name,
                mobile_phone: phone,
                home_address: address1 + address2,
                notification_email: email )


end
