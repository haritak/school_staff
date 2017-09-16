class SchoolStudentsController < ApplicationController
  before_action :set_school_student, only: [:show, :edit, :update, :destroy]

  # GET /school_students
  # GET /school_students.json
  def index
    @school_students = SchoolStudent.all
  end

  # GET /school_students/1
  # GET /school_students/1.json
  def show
  end

  # GET /school_students/new
  def new
    @school_student = SchoolStudent.new
  end

  # GET /school_students/1/edit
  def edit
  end

  # POST /school_students
  # POST /school_students.json
  def create
    @school_student = SchoolStudent.new(school_student_params)

    respond_to do |format|
      if @school_student.save
        format.html { redirect_to @school_student, notice: 'School student was successfully created.' }
        format.json { render :show, status: :created, location: @school_student }
      else
        format.html { render :new }
        format.json { render json: @school_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_students/1
  # PATCH/PUT /school_students/1.json
  def update
    respond_to do |format|
      if @school_student.update(school_student_params)
        format.html { redirect_to @school_student, notice: 'School student was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_student }
      else
        format.html { render :edit }
        format.json { render json: @school_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_students/1
  # DELETE /school_students/1.json
  def destroy
    @school_student.destroy
    respond_to do |format|
      format.html { redirect_to school_students_url, notice: 'School student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_student
      @school_student = SchoolStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_student_params
      params.require(:school_student).permit(:school_id, :student_id, :registry_no)
    end
end
