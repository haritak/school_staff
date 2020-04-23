class PersonelProcessorController < ApplicationController

  skip_before_action :authorize

  def pick_school
    @schools = School.all
  end

  def pick_teacher
    school = School.find( params[:school_id] )
    @teachers = SchoolTeacher.where( school: school ).to_a
  end

  def homepage
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
  end

  def select_request_type
    teacher_id = params[ :teacher_id ]
    school_id = params[ :school_id ]
    @school_teacher = SchoolTeacher.find( teacher_id )
    @teacher = @school_teacher.teacher
    @school = School.find( school_id )
    tmp =  TeacherSpecialty.where( teacher: @teacher ).to_a

    @available_requests = RequestSpecification.where( teacher_working_class: @teacher.teacher_working_class )
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

    @available_requests = RequestSpecification.where( teacher_working_class: @teacher.teacher_working_class )
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

    req_hours_per_course = {}
    params.each do |p, v|
      if p.start_with? "registered_hours"
        parts = p.split
        class_grade_id = parts[1].to_i
        class_number = parts[2].to_i
        lesson_id = parts[3].to_i
        req_hours_per_course[ "#{class_grade_id} #{class_number} #{lesson_id}" ] = v
      end
    end

    params.each do |p|
      theTeacher = SchoolTeacher.find( teacher_id )
      parts = p.split

      if parts[0].start_with? "count_me_in"

        school_course_id = parts[1].to_i
        theSchoolCourse = SchoolCourse.find( school_course_id )
        SchoolCourseTeacher.create( school_course: theSchoolCourse,
                                   school_teacher: theTeacher )

      elsif parts[0].start_with? "register_me"

        class_grade_id = parts[1].to_i
        class_number = parts[2].to_i
        lesson_id = parts[3].to_i

        requested_hours = req_hours_per_course[ "#{class_grade_id} #{class_number} #{lesson_id}"]

        theSchool = School.find( school_id )
        theGrade = SchoolGradeSpecialty.find( class_grade_id )
        theClass = SchoolClass.find_by( school_grade_specialty: theGrade,
                                       number: class_number )
        theLesson = Lesson.find( lesson_id )

        theSchoolCource = SchoolCourse.create( school_class: theClass,
                                              duration: requested_hours,
                                              lesson: theLesson)

        SchoolCourseTeacher.create( school_course: theSchoolCource,
                                   school_teacher: theTeacher )
      end
    end

    redirect_to pick_lessons_for_path( teacher_id, school_id)
  end

  def get_available_courses_for( someteacher, someschool )

    all_classes_at_school = SchoolClass.where( school: someschool,
                                            deprecated: false )
    my_teacher_specialties = TeacherSpecialty.where( teacher: someteacher )

    all_courses = []
    all_classes_at_school.each do |sc|
      class_grade = sc.school_grade_specialty
      class_number = sc.number

      lessons = get_lessons_for( sc, my_teacher_specialties )

      school_class = SchoolClass.find_by( school_grade_specialty: class_grade,
                                         number: class_number )
      lessons.each do |lesson|

        total_required_hours = 
          school_class.get_total_required_hours( lesson[:lesson] )

        school_courses = SchoolCourse.where( school_class: school_class,
                                            lesson: lesson[:lesson] ).to_a

        #already registered
        already_registered_hours = 0
        school_courses.each do |school_course|
          already_registered = SchoolCourseTeacher.where(
            school_course: school_course ).to_a

            already_registered_hours = 
              already_registered.length * school_course.duration

            all_courses << { school_course: school_course,
                             school_class: sc, #left for convienience
                             lesson: lesson[:lesson], #left for convienience
                             duration: school_course.duration, #left for convienience
                             lesson_priority: lesson[:assignment_priority], 
                             already_registered: already_registered,
            }
        end#for each school course

        #add an empty place holder for new school courses
        if already_registered_hours < total_required_hours
          available_hours = total_required_hours - already_registered_hours
          all_courses << { school_course: nil,
                           school_class: sc,
                           lesson: lesson[:lesson],
                           duration: available_hours,
                           lesson_priority: lesson[:assignment_priority], 
                           already_registered: [],
          }
        end

      end
    end
    all_courses.sort! do |left, right|
      left[:school_class].school_grade_specialty <=> right[:school_class].school_grade_specialty 
    end

    return all_courses
  end

  def get_lessons_for( school_class, specialties )

    specialties_codes = ""
    specialties.each do |sp|
      specialties_codes += (sp.specialty.code + " ")
    end

    found_lessons = []
    lessons = school_class.get_required_lessons
    lessons.each do |lesson|
      lesson_assignments = LessonAssignment.where( lesson: lesson )
      lesson_assignments.each do |lesson_assignment|
        if specialties_codes.include? lesson_assignment.specialty.code 
          found_lessons << { lesson: lesson, 
                             assignment_priority: lesson_assignment.priority 
          }
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
