class SchoolCourseTeachersController < ApplicationController
  before_action :set_school_course_teacher, only: [:show, :edit, :update, :destroy]

  # GET /school_course_teachers
  # GET /school_course_teachers.json
  def index
    @school_course_teachers = SchoolCourseTeacher.all
  end

  # GET /school_course_teachers/1
  # GET /school_course_teachers/1.json
  def show
  end

  # GET /school_course_teachers/new
  def new
    @school_course_teacher = SchoolCourseTeacher.new
  end

  # GET /school_course_teachers/1/edit
  def edit
  end

  # POST /school_course_teachers
  # POST /school_course_teachers.json
  def create
    @school_course_teacher = SchoolCourseTeacher.new(school_course_teacher_params)

    respond_to do |format|
      if @school_course_teacher.save
        format.html { redirect_to @school_course_teacher, notice: 'School course teacher was successfully created.' }
        format.json { render :show, status: :created, location: @school_course_teacher }
      else
        format.html { render :new }
        format.json { render json: @school_course_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_course_teachers/1
  # PATCH/PUT /school_course_teachers/1.json
  def update
    respond_to do |format|
      if @school_course_teacher.update(school_course_teacher_params)
        format.html { redirect_to @school_course_teacher, notice: 'School course teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_course_teacher }
      else
        format.html { render :edit }
        format.json { render json: @school_course_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_course_teachers/1
  # DELETE /school_course_teachers/1.json
  def destroy
    @school_course_teacher.destroy
    respond_to do |format|
      format.html { redirect_to school_course_teachers_url, notice: 'School course teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_course_teacher
      @school_course_teacher = SchoolCourseTeacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_course_teacher_params
      params.require(:school_course_teacher).permit(:school_course_id, :teacher_id)
    end
end
