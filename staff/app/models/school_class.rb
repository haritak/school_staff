class SchoolClass < ApplicationRecord
  belongs_to :schoolyear
  belongs_to :school
  belongs_to :school_grade_specialty

  def short_name
    "#{school_grade_specialty.code}#{number}"
  end

  def get_required_lessons
    all_lessons = []

    #first search in school_class_lessons table.
    school_class_lessons = SchoolClassLesson.where( school_class: self )

    if not school_class_lessons or school_class_lessons.blank?
      #If it's empty go on to the next choice
      all_lessons = Lesson.where( school_grade_specialty: school_grade_specialty )
    else
      school_class_lessons.each do |scl|
        all_lessons << scl.lesson
      end
    end

    return all_lessons
  end

  def get_required_hours( lesson )
    if lesson.description.include? "Πληροφορική" or 
        lesson.description.include? "Ερευνητική"
      if capacity > 16
        return 2 * lesson.hours
      end
    end
    return lesson.hours
  end

  def get_required_no_teachers( lesson )
    if lesson.lesson_type.code == 'Ε' #TODO fragile
      if capacity > 12
        return 2
      end
    end

    return 1
  end

  def get_total_required_hours( lesson )
    get_required_no_teachers( lesson ) * get_required_hours( lesson )
  end

  def to_s
    short_name
  end

end
