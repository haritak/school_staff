class Teacher < ApplicationRecord
  belongs_to :person
  belongs_to :school
  has_many :teacher_specialties

  def full_name
    person.last_name + " " + person.first_name
  end
end
