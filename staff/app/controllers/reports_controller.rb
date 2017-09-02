class ReportsController < ApplicationController
  def school_classes_report
    school_classes = SchoolClass.all

    @missing_hours = []
    school_classes.each do |school_class|
      courses = SchoolCourse.where( school_class: school_class )

      required_lesson_hours = 0
      declared_hours = 0
      courses.each do |course|
        required_lesson_hours += course.lesson.hours
        declared_hours += course.duration
      end

      school_grade_specialty = school_class.school_grade_specialty
      lessons = Lesson.where( school_grade_specialty: school_grade_specialty )
      total_hours_for_grade = 0
      lessons.each do |lesson|
        total_hours_for_grade += lesson.hours
      end

      @missing_hours << [ school_class, total_hours_for_grade, required_lesson_hours, declared_hours ]
    end
  end
end
