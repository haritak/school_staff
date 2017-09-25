class TeacherWorkingClassesController < ApplicationController
  before_action :set_teacher_working_class, only: [:show, :edit, :update, :destroy]

  def index
    @teacher_working_classes = TeacherWorkingClass.all
  end
  def show
  end
  def edit
  end

  def new
    @teacher_working_class= TeacherWorkingClass.new
  end

  # POST
  def create
    @teacher_working_class = TeacherWorkingClass.new(teacher_working_class_params)

    respond_to do |format|
      if @teacher_working_class.save
        format.html { redirect_to @teacher_working_class, notice: 'Teacher working class was successfully created.' }
        format.json { render :show, status: :created, location: @teacher_working_class }
      else
        format.html { render :new }
        format.json { render json: @teacher_working_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @teacher_working_class.update(teacher_working_class_params)
        format.html { redirect_to @teacher_working_class, notice: 'Teacher working class was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher_working_class }
      else
        format.html { render :edit }
        format.json { render json: @teacher_working_class.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @teacher_working_class.destroy
    respond_to do |format|
      format.html { redirect_to teacher_working_classes_url, notice: 'Teacher working class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_working_class
      @teacher_working_class = TeacherWorkingClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_working_class_params
      params.require(:teacher_working_class).permit(:id, :description, :code)
    end
end
