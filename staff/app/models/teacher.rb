class Teacher < ApplicationRecord
  belongs_to :person
  belongs_to :school

  def teacher_name
    person.last_name + " " + person.first_name
  end
end
