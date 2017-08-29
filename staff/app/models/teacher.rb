class Teacher < ApplicationRecord
  belongs_to :person
  belongs_to :school
end
