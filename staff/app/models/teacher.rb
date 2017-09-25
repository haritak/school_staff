class Teacher < ApplicationRecord
  belongs_to :person
  belongs_to :school
  belongs_to :teacher_working_class
  has_many :teacher_specialties

  def full_name
    person.last_name + " " + person.first_name
  end

  def to_s
    toReturn = full_name
    teacher_specialties.each do |teacher_specialty|
      toReturn += " "+ teacher_specialty.specialty.code
    end
    return toReturn
  end
end
