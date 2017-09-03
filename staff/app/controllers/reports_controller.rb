class ReportsController < ApplicationController

  def registered_lessons_per_class
    @school_classes = SchoolClass.all
    @lessons_per_class = {}
    @school_classes.each do |school_class|
      courses = SchoolCourse.where( school_class: school_class )
      @lessons_per_class[ school_class ] = courses
    end
  end

  def lessons_per_teacher
    school_teachers = SchoolTeacher.all
    @courses_per_teacher = {}
    school_teachers.each do |sct|
      @courses_per_teacher[ sct ] = [] if not @courses_per_teacher[ sct ]
      school_courses = SchoolCourseTeacher.where( school_teacher: sct )
      school_courses.each do |sc|
        @courses_per_teacher[ sct ] << sc
      end
    end
  end

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
  def school_teachers_report
    teachers = SchoolTeacher.all

    @teacher_availability = []
    teachers.each do |teacher|
      courses = SchoolCourseTeacher.where( school_teacher: teacher)

      registered_hours = 0
      courses.each do |course|
        registered_hours += course.school_course.duration
      end

      @teacher_availability << [ teacher, registered_hours ]
    end
  end
end
