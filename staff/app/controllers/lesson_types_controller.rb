class LessonTypesController < ApplicationController
  before_action :set_lesson_type, only: [:show, :edit, :update, :destroy]

  # GET /lesson_types
  # GET /lesson_types.json
  def index
    @lesson_types = LessonType.all
  end

  # GET /lesson_types/1
  # GET /lesson_types/1.json
  def show
  end

  # GET /lesson_types/new
  def new
    @lesson_type = LessonType.new
  end

  # GET /lesson_types/1/edit
  def edit
  end

  # POST /lesson_types
  # POST /lesson_types.json
  def create
    @lesson_type = LessonType.new(lesson_type_params)

    respond_to do |format|
      if @lesson_type.save
        format.html { redirect_to @lesson_type, notice: 'Lesson type was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_type }
      else
        format.html { render :new }
        format.json { render json: @lesson_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_types/1
  # PATCH/PUT /lesson_types/1.json
  def update
    respond_to do |format|
      if @lesson_type.update(lesson_type_params)
        format.html { redirect_to @lesson_type, notice: 'Lesson type was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_type }
      else
        format.html { render :edit }
        format.json { render json: @lesson_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_types/1
  # DELETE /lesson_types/1.json
  def destroy
    @lesson_type.destroy
    respond_to do |format|
      format.html { redirect_to lesson_types_url, notice: 'Lesson type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_type
      @lesson_type = LessonType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_type_params
      params.require(:lesson_type).permit(:code, :description)
    end
end
