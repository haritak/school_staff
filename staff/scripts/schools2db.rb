#!../bin/rails runner 
#
#run this script with:
#bin/rails runner path/to/filename.rb
#
#
#

schools = [
  ["1740300","1o ΕΠΑΛ Μοιρών"],
]

schools.each do |k, v|
    begin
      School.create( code: k, title: v )
      puts "#{k}: #{v} inserted"
    rescue ActiveRecord::RecordNotUnique => e
      puts "#{k}: already exists"
    end
end

puts "All done"

