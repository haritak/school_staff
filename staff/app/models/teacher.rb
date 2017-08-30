class Teacher < ApplicationRecord
  belongs_to :person
  belongs_to :school

  def full_name
    person.last_name + " " + person.first_name
  end
end
