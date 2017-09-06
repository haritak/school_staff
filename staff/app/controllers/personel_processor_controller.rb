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
    @school_teacher = SchoolTeacher.find( teacher_id )
    @teacher = @school_teacher.teacher
    @school = School.find( school_id )

    tmp =  TeacherSpecialty.where( teacher: @teacher ).to_a

    @specialties = []
    tmp.each do | ts |
      @specialties << ts.specialty
    end

    @current_courses = SchoolCourseTeacher.where( school_teacher: @school_teacher ).to_a
    @available_courses = get_available_courses_for( @teacher, @school )
  end

  def unregister_lessons
    school_teacher_id = params[ :teacher_id ]
    school_id = params[ :school_id ]
    school_course_id = params[ :school_course_id ]

    theSchoolCourseTeacher =
      SchoolCourseTeacher.find_by( school_course_id: school_course_id,
                                  school_teacher_id: school_teacher_id )

    theSchoolCourseTeacher.destroy

    begin
      theSchoolCourse = SchoolCourse.find( school_course_id )
      theSchoolCourse.destroy
    rescue ActiveRecord::StatementInvalid => e
      #ignore the case this entry cannot be 
      #deleted due to another SchoolTeacher
      #refering to that entry (in case of co-teaching the
      #same course)
    end

    redirect_to pick_lessons_for_path( school_teacher_id, school_id )
  end

  def register_lessons
    teacher_id = params[:teacher_id]
    school_id = params[:school_id]

    all_requested_hours = {}
    params.each do |p, v|
      if p.start_with? "registered_hours"
        parts = p.split
        class_grade_id = parts[1].to_i
        class_number = parts[2].to_i
        lesson_id = parts[3].to_i
        all_requested_hours[ "#{class_grade_id} #{class_number} #{lesson_id}" ] = v
      end
    end

    params.each do |p|
      if p.start_with? "register_me"
        parts = p.split
        class_grade_id = parts[1].to_i
        class_number = parts[2].to_i
        lesson_id = parts[3].to_i

        requested_hours = all_requested_hours[ "#{class_grade_id} #{class_number} #{lesson_id}"]

        theSchool = School.find( school_id )
        theGrade = SchoolGradeSpecialty.find( class_grade_id )
        theClass = SchoolClass.find_by( school_grade_specialty: theGrade,
                                       number: class_number )
        theLesson = Lesson.find( lesson_id )

        theSchoolCource = SchoolCourse.find_by( school_class: theClass,
                                               lesson: theLesson,
                                              duration: requested_hours )
        if not theSchoolCource
          theSchoolCource = SchoolCourse.create( school_class: theClass,
                                                duration: requested_hours,
                                                lesson: theLesson)
        end

        theTeacher = SchoolTeacher.find( teacher_id )
        SchoolCourseTeacher.create( school_course: theSchoolCource,
                                   school_teacher: theTeacher )
          SchoolCourse.create
      end
    end

    redirect_to pick_lessons_for_path( teacher_id, school_id)
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
        school_class = SchoolClass.find_by( school_grade_specialty: class_grade,
                                           number: class_number )
        school_course = SchoolCourse.find_by( school_class: school_class,
                                             lesson: lesson )
        already_registered = SchoolCourseTeacher.where(
          school_course: school_course ).to_a
        all_courses << [ class_grade, 
                         class_number, 
                         lesson[0],  #lesson
                         lesson[1],  #lesson assignment priority
                         already_registered
        ]
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

  def show_all
    school_teacher_id = params[ :teacher_id ]
    school_id = params[ :school_id ]
    @school = School.find( school_id )
    @teacher = SchoolTeacher.find( school_teacher_id )
    @available_classes = SchoolClass.where( school: @school) #TODO : Should include schoolyear
    @available_lessons = Lesson.where( deprecated: false )
  end

  def register_unassigned_lessons
    school_teacher_id = params[ :teacher_id ]
    school_id = params[ :school_id ]

    class_id = params[ :class_id ]
    lesson_id = params[ :lesson_id ]

    school_class = SchoolClass.find( class_id )
    lesson = Lesson.find( lesson_id )
    school_teacher = SchoolTeacher.find( school_teacher_id )

    
    alert = ""

    if lesson.school_grade_specialty == 
        school_class.school_grade_specialty
      #continue only if assignment is compatible
      existing_course = SchoolCourse.find_by( school_class: school_class,
                                           lesson: lesson )
      if not existing_course
        existing_course = 
          SchoolCourse.create( school_class: school_class, lesson: lesson, duration: lesson.hours )
      end

      #register teacher with course
      SchoolCourseTeacher.create( school_course: existing_course,
                                 school_teacher: school_teacher )
    else
      alert = "Δεν επιτρέπεται το συγκεκριμένο μάθημα με το συγκεκριμένο τμήμα"
      redirect_to pick_unassigned_lessons_for_path( school_teacher_id,
                                                   school_id), alert: alert
      return
    end

    redirect_to pick_lessons_for_path( school_teacher_id, school_id)
  end

end
