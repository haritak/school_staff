#!bin/rails runner
#
last_name = ""
first_name = ""
parent_name = ""
user_name = ""
password = ""
users = []
File.open("scripts/output.html").each do |line|
  if line =~ /.*Επίθετο:.*>([Α-Ω ()A-ZΪΫ\-]+)<.*/

    last_name = $1.gsub(",","")

  elsif line =~ /.*Όνομα:.*>([Α-Ω ()A-ZΫΪ\-]+)<.*/

    first_name = $1.gsub(",","")

  elsif line =~ /.*Κηδεμόνας:.*>([Α-Ω ()A-ZΪΫ\-]+)<.*/

    parent_name = $1.gsub(",","")

  elsif line =~ /.*Ονομα Χρήστη.*>([a-z ]+)<.*/

    user_name = $1.gsub(",","")

  elsif line =~ /.*Κωδικός πρόσβασης.*<td><b>(.+)<\\\/b>.*/

    password = $1.gsub(",","")

  elsif line =~ /.*table><br>';.*/

    users << { last_name: last_name.strip,
               first_name: first_name.strip,
               parent_name: parent_name.strip,
               user_name: user_name.strip,
               password: password.strip }

    last_name = first_name = password = parent_name = user_name = ""

  end
end


errors = []
2.times do |i|

  puts "Checking data..." if i == 0
  if i==1
    if errors.length>0
      puts "The following errors occured:"
      errors.each do |error|
        p error
      end
      puts "If you hit enter, those names will be ignored."
    end

    puts "Checking completed, ready to import usernames and passwords"
    puts "Press enter to continue"
    $stdin.gets
  end

  users.each do |user|
    puts "#{user[:user_name]},#{user[:last_name]} #{user[:first_name]} του #{user[:parent_name]},/bin/bash,#{user[:password]}"
    if user[:last_name]=="" or
        user[:first_name]=="" or
        user[:parent_name] == "" or
        user[:user_name] == "" or
        user[:password] == ""
      raise "Error in the above student"
    end

    students = Student.where( first_name: user[:first_name],
                             last_name: user[:last_name],
                             father_name: user[:parent_name] ).to_a
    if students.length != 1
      p students
      errors << user
    end

    next if i==0
    next if students.length != 1

    student = students[0]
    school_student = SchoolStudent.find_by( student: student )
    school_student.update( username: user[:user_name] )
    school_student.update( password: user[:password] )

  end
end


