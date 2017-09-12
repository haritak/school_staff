class ScheduleController < ApplicationController

  def index
  end

  def save_form
  end

  def save
    schedule_snapshot_comment = params['schedule_snapshot_comment']
    school_courses = SchoolCourse.all

    #
    # if the following works, it's incredible!
    # src: https://stackoverflow.com/questions/4974049/ruby-on-rails-getting-the-max-value-from-a-db-column
    #
    max_saved_school_course = SavedSchoolCourse.maximum( :save_no )

    save_no = max_saved_school_course ? max_saved_school_course + 1 : 0

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

    ScheduleSnapshot.create( save_no: save_no,
                            description: schedule_snapshot_comment )

    redirect_to '/schedule/index'
  end

  def diff_general
    @all_snapshots = ScheduleSnapshot.all
  end

  def diff(latest_no=nil, previous_no=nil)
    if params
      params.each do |p|
        if p.start_with? "save_no"
          a = p.split[1].to_i
          latest_no = a if not latest_no
          previous_no = a 
        end
      end
    end
    if latest_no and previous_no and previous_no>latest_no
      b = latest_no
      latest_no = previous_no
      previous_no = b
    end

    if not latest_no
      latest_no = SavedSchoolCourse.maximum( :save_no )
      previous_no = latest_no - 1
    end

    previous_ssc = SavedSchoolCourse.where( save_no: previous_no )

    @schedule_snapshot_latest = ScheduleSnapshot.find_by( save_no: latest_no )
    @schedule_snapshot_previous = ScheduleSnapshot.find_by( save_no: previous_no )

    @latest_schedule = get_saved_schedule_no( latest_no )
    @previous_schedule = get_saved_schedule_no( previous_no )

   # Two way differences:
    #  - (1) which of the saved_school_courses do not exist in school_courses
    #  - (2) which of the school_courses do not exist in saved_school_courses
    #  - (3) for the school_courses that exist both in latest in in one before:
    #        - check their duration
    
    #
    # Remove the lines that remained the same.
    #
    @previous_schedule.each do |line|
      if line.ends_with? "==" or
          line.ends_with? "--" or
          line.ends_with? "++"
        next
      end
      if line_no = line_pos_in( @latest_schedule, line )
        line << "=="
        @latest_schedule[ line_no ] << "=="
      end
    end
  end

  private 

  def line_pos_in( table, line )
    table.each_with_index do |table_line, i|
      if table_line == line
        return i
      end
    end
    return nil
  end

  def get_saved_schedule_no(no)
    schedule = []
    ssc = SavedSchoolCourse.where( save_no: no )
    ssc.each do |lssc|
      teachers = SavedSchoolCourseTeacher.where( saved_school_course: lssc, 
                                                save_no: no )
      teachers.each do |teacher|
        schedule << "#{lssc} #{teacher}"
      end
    end
    return schedule
  end

end
