class SavedSchoolCourseTeachersController < ApplicationController
  before_action :set_saved_school_course_teacher, only: [:show, :edit, :update, :destroy]

  # GET /saved_school_course_teachers
  # GET /saved_school_course_teachers.json
  def index
    @saved_school_course_teachers = SavedSchoolCourseTeacher.all
  end

  # GET /saved_school_course_teachers/1
  # GET /saved_school_course_teachers/1.json
  def show
  end

  # GET /saved_school_course_teachers/new
  def new
    @saved_school_course_teacher = SavedSchoolCourseTeacher.new
  end

  # GET /saved_school_course_teachers/1/edit
  def edit
  end

  # POST /saved_school_course_teachers
  # POST /saved_school_course_teachers.json
  def create
    @saved_school_course_teacher = SavedSchoolCourseTeacher.new(saved_school_course_teacher_params)

    respond_to do |format|
      if @saved_school_course_teacher.save
        format.html { redirect_to @saved_school_course_teacher, notice: 'Saved school course teacher was successfully created.' }
        format.json { render :show, status: :created, location: @saved_school_course_teacher }
      else
        format.html { render :new }
        format.json { render json: @saved_school_course_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_school_course_teachers/1
  # PATCH/PUT /saved_school_course_teachers/1.json
  def update
    respond_to do |format|
      if @saved_school_course_teacher.update(saved_school_course_teacher_params)
        format.html { redirect_to @saved_school_course_teacher, notice: 'Saved school course teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_school_course_teacher }
      else
        format.html { render :edit }
        format.json { render json: @saved_school_course_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_school_course_teachers/1
  # DELETE /saved_school_course_teachers/1.json
  def destroy
    @saved_school_course_teacher.destroy
    respond_to do |format|
      format.html { redirect_to saved_school_course_teachers_url, notice: 'Saved school course teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_school_course_teacher
      @saved_school_course_teacher = SavedSchoolCourseTeacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saved_school_course_teacher_params
      params.require(:saved_school_course_teacher).permit(:saved_school_course_id, :school_teacher_id, :save_no)
    end
end
