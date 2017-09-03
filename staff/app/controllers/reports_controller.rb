class ReportsController < ApplicationController
  def unregistered_lessons_per_class
    @school_classes = SchoolClass.all
    @missing_lessons = {}
    @school_classes.each do |school_class|
      required_lessons = school_class.get_required_lessons

      @missing_lessons[school_class] = [] 
      required_lessons.each do |lesson|
        school_courses = SchoolCourse.where( school_class: school_class,
                                              lesson: lesson ).to_a
        if school_courses.length==0
          required_teachers = school_class.get_required_no_teachers( lesson )
          required_hours = school_class.get_required_hours( lesson )
          @missing_lessons[school_class] << [lesson, 
                                             required_teachers,
                                             required_hours ]
          next
        end

        required_no_teachers = 
          school_class.get_required_no_teachers( lesson )
        required_hours =
          school_class.get_required_hours( lesson )

        total_teachers = {}
        total_hours = 0
        school_courses.each do |sc|
          total_hours += sc.duration
          school_course_teachers = SchoolCourseTeacher.where( school_course: sc )
          school_course_teachers.each do |sct|
            t = sct.school_teacher
            total_teachers[ t ] =  "not used"
          end
        end
        hours = required_hours-total_hours
        hours = hours<0? 0 : hours
        teachers = required_no_teachers - total_teachers.length
        teachers = teachers<0? 0 : teachers
        @missing_lessons[school_class] << [lesson, teachers, hours] if hours>0 or teachers>0
      end
    end
  end

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
