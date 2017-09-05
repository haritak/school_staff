class SavedSchoolCoursesController < ApplicationController
  before_action :set_saved_school_course, only: [:show, :edit, :update, :destroy]

  # GET /saved_school_courses
  # GET /saved_school_courses.json
  def index
    @saved_school_courses = SavedSchoolCourse.all
  end

  # GET /saved_school_courses/1
  # GET /saved_school_courses/1.json
  def show
  end

  # GET /saved_school_courses/new
  def new
    @saved_school_course = SavedSchoolCourse.new
  end

  # GET /saved_school_courses/1/edit
  def edit
  end

  # POST /saved_school_courses
  # POST /saved_school_courses.json
  def create
    @saved_school_course = SavedSchoolCourse.new(saved_school_course_params)

    respond_to do |format|
      if @saved_school_course.save
        format.html { redirect_to @saved_school_course, notice: 'Saved school course was successfully created.' }
        format.json { render :show, status: :created, location: @saved_school_course }
      else
        format.html { render :new }
        format.json { render json: @saved_school_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_school_courses/1
  # PATCH/PUT /saved_school_courses/1.json
  def update
    respond_to do |format|
      if @saved_school_course.update(saved_school_course_params)
        format.html { redirect_to @saved_school_course, notice: 'Saved school course was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_school_course }
      else
        format.html { render :edit }
        format.json { render json: @saved_school_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_school_courses/1
  # DELETE /saved_school_courses/1.json
  def destroy
    @saved_school_course.destroy
    respond_to do |format|
      format.html { redirect_to saved_school_courses_url, notice: 'Saved school course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_school_course
      @saved_school_course = SavedSchoolCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saved_school_course_params
      params.require(:saved_school_course).permit(:school_class_id, :lesson_id, :duration, :save_no)
    end
end
