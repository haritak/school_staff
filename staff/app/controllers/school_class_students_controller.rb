class SchoolClassStudentsController < ApplicationController
  before_action :set_school_class_student, only: [:show, :edit, :update, :destroy]

  # GET /school_class_students
  # GET /school_class_students.json
  def index
    @school_class_students = SchoolClassStudent.all.order( :school_class_id, 
                                                        :school_student_id )
  end

  # GET /school_class_students/1
  # GET /school_class_students/1.json
  def show
  end

  # GET /school_class_students/new
  def new
    @school_class_student = SchoolClassStudent.new
  end

  # GET /school_class_students/1/edit
  def edit
  end

  # POST /school_class_students
  # POST /school_class_students.json
  def create
    @school_class_student = SchoolClassStudent.new(school_class_student_params)

    respond_to do |format|
      if @school_class_student.save
        format.html { redirect_to @school_class_student, notice: 'School class student was successfully created.' }
        format.json { render :show, status: :created, location: @school_class_student }
      else
        format.html { render :new }
        format.json { render json: @school_class_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_class_students/1
  # PATCH/PUT /school_class_students/1.json
  def update
    respond_to do |format|
      if @school_class_student.update(school_class_student_params)
        format.html { redirect_to @school_class_student, notice: 'School class student was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_class_student }
      else
        format.html { render :edit }
        format.json { render json: @school_class_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_class_students/1
  # DELETE /school_class_students/1.json
  def destroy
    @school_class_student.destroy
    respond_to do |format|
      format.html { redirect_to school_class_students_url, notice: 'School class student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_class_student
      @school_class_student = SchoolClassStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_class_student_params
      params.require(:school_class_student).permit(:school_student_id, :school_class_id)
    end
end
