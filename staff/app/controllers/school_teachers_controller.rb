class SchoolTeachersController < ApplicationController
  before_action :set_school_teacher, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize,
     only: [:create_all, :new_all, :new, :create]

  # GET /school_teachers
  # GET /school_teachers.json
  def index
    @school_teachers = SchoolTeacher.all
  end

  # GET /school_teachers/1
  # GET /school_teachers/1.json
  def show
  end

  def new_all
    @person = Person.new
    @teacher = Teacher.new
    @school_teacher = SchoolTeacher.new
  end

  def create_all
    gender = params[ :gender ]
    first_name = params[ :first_name ]
    last_name = params[ :last_name ]
    father_name = params[ :father_name ]
    mother_name = params[ :mother_name ]
    notification_email = params[ :notification_email ]
    mobile_phone = params[ :mobile_phone ]
    home_address = params[ :home_address ]
    specialty1_id = params[ :specialty1 ][:id]
    specialty2_id = params[ :specialty2 ][:id]
    teaching_hours = params[ :teaching_hours ]
    school_id = params[ :school ][:id]
    disposal_duration = params[ :disposal_duration ]
    teacher_working_class_id = params[ :teacher_working_class ][:id]
    date_in_school = date_employed = Date.today #TODO

    school = School.find( school_id )
    specialty1 = Specialty.find( specialty1_id )
    specialty2 = Specialty.find_by( id: specialty2_id )
    teacher_working_class = TeacherWorkingClass.find( teacher_working_class_id )


    person = Person.find_by( first_name: first_name,
                            last_name: last_name,
                            father_name: father_name,
                            mother_name: mother_name )
    if not person
      person = Person.create( gender: gender,
                              first_name: first_name,
                              last_name: last_name,
                              father_name: father_name,
                              mother_name: mother_name,
                              notification_email: notification_email,
                              mobile_phone: mobile_phone,
                              home_address: home_address )
    end

    raise "Failed to find or create person" if not person

    teacher = Teacher.find_by( person: person )
    if not teacher 
      teacher = Teacher.create( person: person,
                     school: school,
                     date_in_school: date_in_school,
                     date_employed: date_employed,
                     teaching_hours: teaching_hours,
                     teacher_working_class: teacher_working_class )
    end

    raise "Couldn't register person as teacher" if not teacher

    begin
      TeacherSpecialty.create( teacher: teacher, 
                              specialty: specialty1,
                              priority: 100 )
      if specialty2 
        TeacherSpecialty.create( teacher: teacher, 
                                specialty: specialty2,
                                priority: 200 )
      end
    rescue => e
      p e
    end

    school_teacher = SchoolTeacher.find_by( teacher: teacher,
                                           school: school )
    if not school_teacher
      school_teacher = SchoolTeacher.create( teacher: teacher,
                           school: school,
                           disposal_duration: disposal_duration )
    end

    redirect_to pick_lessons_for_path( school_teacher, school )
  end

  # GET /school_teachers/new
  def new
    @school_teacher = SchoolTeacher.new
  end

  # GET /school_teachers/1/edit
  def edit
  end

  # POST /school_teachers
  # POST /school_teachers.json
  def create
    @school_teacher = SchoolTeacher.new(school_teacher_params)

    if @school_teacher.disposal_duration > 
      @school_teacher.teacher.teaching_hours
      @school_teacher.disposal_duration = @school_teacher.teacher.teaching_hours
    end

    respond_to do |format|
      if @school_teacher.save
        format.html { redirect_to @school_teacher, notice: 'School teacher was successfully created.' }
        format.json { render :show, status: :created, location: @school_teacher }
      else
        format.html { render :new }
        format.json { render json: @school_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_teachers/1
  # PATCH/PUT /school_teachers/1.json
  def update
    respond_to do |format|
      if @school_teacher.update(school_teacher_params)
        format.html { redirect_to @school_teacher, notice: 'School teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_teacher }
      else
        format.html { render :edit }
        format.json { render json: @school_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_teachers/1
  # DELETE /school_teachers/1.json
  def destroy
    @school_teacher.destroy
    respond_to do |format|
      format.html { redirect_to school_teachers_url, notice: 'School teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_teacher
      @school_teacher = SchoolTeacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_teacher_params
      params.require(:school_teacher).permit(:teacher_id, :school_id, :disposal_duration)
    end
end
