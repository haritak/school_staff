class SchoolClassLessonsController < ApplicationController
  before_action :set_school_class_lesson, only: [:show, :edit, :update, :destroy]

  # GET /school_class_lessons
  # GET /school_class_lessons.json
  def index
    @school_class_lessons = SchoolClassLesson.all
  end

  # GET /school_class_lessons/1
  # GET /school_class_lessons/1.json
  def show
  end

  # GET /school_class_lessons/new
  def new
    @school_class_lesson = SchoolClassLesson.new
  end

  # GET /school_class_lessons/1/edit
  def edit
  end

  # POST /school_class_lessons
  # POST /school_class_lessons.json
  def create
    @school_class_lesson = SchoolClassLesson.new(school_class_lesson_params)

    respond_to do |format|
      if @school_class_lesson.save
        format.html { redirect_to @school_class_lesson, notice: 'School class lesson was successfully created.' }
        format.json { render :show, status: :created, location: @school_class_lesson }
      else
        format.html { render :new }
        format.json { render json: @school_class_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_class_lessons/1
  # PATCH/PUT /school_class_lessons/1.json
  def update
    respond_to do |format|
      if @school_class_lesson.update(school_class_lesson_params)
        format.html { redirect_to @school_class_lesson, notice: 'School class lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_class_lesson }
      else
        format.html { render :edit }
        format.json { render json: @school_class_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_class_lessons/1
  # DELETE /school_class_lessons/1.json
  def destroy
    @school_class_lesson.destroy
    respond_to do |format|
      format.html { redirect_to school_class_lessons_url, notice: 'School class lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_class_lesson
      @school_class_lesson = SchoolClassLesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_class_lesson_params
      params.require(:school_class_lesson).permit(:school_class_id, :lesson_id)
    end
end
