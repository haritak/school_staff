class PersonelProcessorController < ApplicationController

  def pick_school
    @schools = School.all
  end

  def pick_teacher
    school = School.find( params[:school_id] )
    @teachers = SchoolTeacher.where( school: school ).to_a
  end

  def show_status
    teacher_id = params[ :teacher_id ]
    school_id = params[ :school_id ]
    @teacher = Teacher.find( teacher_id )
    @school = School.find( school_id )

    tmp =  TeacherSpecialty.where( teacher: @teacher ).to_a

    @specialties = []
    tmp.each do | ts |
      @specialties << ts.specialty
    end

    @current_courses = SchoolCourseTeacher.where( teacher: @teacher ).to_a
    @available_courses = get_available_courses_for( @teacher, @school )
  end

  def get_available_courses_for( someteacher, someschool )

    all_classes_at_school = SchoolClass.where( school: someschool )
    all_teacher_specialties = TeacherSpecialty.where( teacher: someteacher )

    all_courses = []
    all_classes_at_school.each do |sc|
      class_grade = sc.school_grade_specialty
      class_number = sc.number

      lessons = get_lessons_for( class_grade, all_teacher_specialties )
      lessons.each do |lesson|
        all_courses << [ class_grade, class_number, lesson[0], lesson[1] ]
      end
    end
    all_courses.sort! do |left, right|
      left[3] <=> right[3]
    end

    return all_courses
  end

  def get_lessons_for( grade, specialties )
    specialties_codes = ""
    specialties.each do |sp|
      specialties_codes += (sp.specialty.code + " ")
    end

    found_lessons = []
    lessons = Lesson.where( school_grade_specialty: grade )
    lessons.each do |lesson|
      lesson_assignments = LessonAssignment.where( lesson: lesson )
      lesson_assignments.each do |lesson_assignment|
        if specialties_codes.include? lesson_assignment.specialty.code 
          found_lessons << [lesson, lesson_assignment.priority ]
        end
      end
    end
    return found_lessons
  end
end
