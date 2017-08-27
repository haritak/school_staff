class LessonAssignmentsController < ApplicationController
  before_action :set_lesson_assignment, only: [:show, :edit, :update, :destroy]

  # GET /lesson_assignments
  # GET /lesson_assignments.json
  def index
    @lesson_assignments = LessonAssignment.all
  end

  # GET /lesson_assignments/1
  # GET /lesson_assignments/1.json
  def show
  end

  # GET /lesson_assignments/new
  def new
    @lesson_assignment = LessonAssignment.new
  end

  # GET /lesson_assignments/1/edit
  def edit
  end

  # POST /lesson_assignments
  # POST /lesson_assignments.json
  def create
    @lesson_assignment = LessonAssignment.new(lesson_assignment_params)

    respond_to do |format|
      if @lesson_assignment.save
        format.html { redirect_to @lesson_assignment, notice: 'Lesson assignment was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_assignment }
      else
        format.html { render :new }
        format.json { render json: @lesson_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_assignments/1
  # PATCH/PUT /lesson_assignments/1.json
  def update
    respond_to do |format|
      if @lesson_assignment.update(lesson_assignment_params)
        format.html { redirect_to @lesson_assignment, notice: 'Lesson assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_assignment }
      else
        format.html { render :edit }
        format.json { render json: @lesson_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_assignments/1
  # DELETE /lesson_assignments/1.json
  def destroy
    @lesson_assignment.destroy
    respond_to do |format|
      format.html { redirect_to lesson_assignments_url, notice: 'Lesson assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_assignment
      @lesson_assignment = LessonAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_assignment_params
      params.require(:lesson_assignment).permit(:lesson_id, :specialty_id, :priority, :reference)
    end
end
