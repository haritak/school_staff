class SchoolClassLesson < ApplicationRecord
  belongs_to :school_class
  belongs_to :lesson
end
