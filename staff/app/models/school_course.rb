class SchoolCourse < ApplicationRecord
  belongs_to :school_class
  belongs_to :lesson

  has_many :school_course_teachers

  def get_required_hours
    if lesson.description.include? "Πληροφορική" or 
        lesson.description.include? "Ερευνητική"
      if capacity > 17
        return 2 * lesson.hours
      end
    end
    return lesson.hours
  end

  def get_required_no_teachers
    if lesson.lesson_type.code == 'Ε' #TODO fragile
      if capacity > 12
        return 2
      end
    end

    return 1
  end

end
