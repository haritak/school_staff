class SchoolGradesController < ApplicationController
  before_action :set_school_grade, only: [:show, :edit, :update, :destroy]

  # GET /school_grades
  # GET /school_grades.json
  def index
    @school_grades = SchoolGrade.all
  end

  # GET /school_grades/1
  # GET /school_grades/1.json
  def show
  end

  # GET /school_grades/new
  def new
    @school_grade = SchoolGrade.new
  end

  # GET /school_grades/1/edit
  def edit
  end

  # POST /school_grades
  # POST /school_grades.json
  def create
    @school_grade = SchoolGrade.new(school_grade_params)

    respond_to do |format|
      if @school_grade.save
        format.html { redirect_to @school_grade, notice: 'SchoolGrade was successfully created.' }
        format.json { render :show, status: :created, location: @school_grade }
      else
        format.html { render :new }
        format.json { render json: @school_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_grades/1
  # PATCH/PUT /school_grades/1.json
  def update
    respond_to do |format|
      if @school_grade.update(school_grade_params)
        format.html { redirect_to @school_grade, notice: 'SchoolGrade was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_grade }
      else
        format.html { render :edit }
        format.json { render json: @school_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_grades/1
  # DELETE /school_grades/1.json
  def destroy
    @school_grade.destroy
    respond_to do |format|
      format.html { redirect_to school_grades_url, notice: 'SchoolGrade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_grade
      @school_grade = SchoolGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_grade_params
      params.require(:school_grade).permit(:code, :description)
    end
end
