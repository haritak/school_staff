class ScheduleController < ApplicationController
  def save
    school_courses = SchoolCourse.all

    #
    # if the following works, it's incredible!
    # src: https://stackoverflow.com/questions/4974049/ruby-on-rails-getting-the-max-value-from-a-db-column
    #
    max_saved_school_course = SavedSchoolCourse.maximum( :save_no )

    save_no = 0
    save_no = max_saved_school_course + 1 if max_saved_school_course

    school_courses.each do |school_course|
      school_class = school_course.school_class
      lesson = school_course.lesson
      duration = school_course.duration

      saved_school_course = SavedSchoolCourse.create( school_class: school_class,
                               lesson: lesson,
                               duration: duration,
                               save_no: save_no )

      school_course.school_course_teachers.each do |school_course_teacher|

        school_teacher = school_course_teacher.school_teacher
        SavedSchoolCourseTeacher.create( saved_school_course: saved_school_course,
                                        school_teacher: school_teacher,
                                        save_no: save_no )

      end #school_course_teacher
    end #school course
  end

  def diff
    school_courses = SchoolCourse.all
    max_saved_school_course = SavedSchoolCourse.maximum( :save_no )

    latest_saved_school_courses = SavedSchoolCourse.where( save_no: max_saved_school_course )


   # Two way differences:
    #  - (1) which of the saved_school_courses do not exist in school_courses
    #  - (2) which of the school_courses do not exist in saved_school_courses
    
    # TODO
    #
    latest_saved_school_courses.each do |lsc|
      theClass = lsc.school_class
      theLesson = lsc.lesson
      theDuration = lsc.duration

      lsc.saved_school_course_teachers.each do | st |
        
      end
    end
  end


end
