class TeacherSpecialtiesController < ApplicationController
  before_action :set_teacher_specialty, only: [:show, :edit, :update, :destroy]

  # GET /teacher_specialties
  # GET /teacher_specialties.json
  def index
    @teacher_specialties = TeacherSpecialty.all
  end

  # GET /teacher_specialties/1
  # GET /teacher_specialties/1.json
  def show
  end

  # GET /teacher_specialties/new
  def new
    @teacher_specialty = TeacherSpecialty.new
  end

  # GET /teacher_specialties/1/edit
  def edit
  end

  # POST /teacher_specialties
  # POST /teacher_specialties.json
  def create
    @teacher_specialty = TeacherSpecialty.new(teacher_specialty_params)

    respond_to do |format|
      if @teacher_specialty.save
        format.html { redirect_to @teacher_specialty, notice: 'Teacher specialty was successfully created.' }
        format.json { render :show, status: :created, location: @teacher_specialty }
      else
        format.html { render :new }
        format.json { render json: @teacher_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_specialties/1
  # PATCH/PUT /teacher_specialties/1.json
  def update
    respond_to do |format|
      if @teacher_specialty.update(teacher_specialty_params)
        format.html { redirect_to @teacher_specialty, notice: 'Teacher specialty was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher_specialty }
      else
        format.html { render :edit }
        format.json { render json: @teacher_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_specialties/1
  # DELETE /teacher_specialties/1.json
  def destroy
    @teacher_specialty.destroy
    respond_to do |format|
      format.html { redirect_to teacher_specialties_url, notice: 'Teacher specialty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_specialty
      @teacher_specialty = TeacherSpecialty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_specialty_params
      params.require(:teacher_specialty).permit(:teacher_id, :specialty_id, :priority)
    end
end
