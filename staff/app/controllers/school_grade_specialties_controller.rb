class SchoolGradeSpecialtiesController < ApplicationController
  before_action :set_school_grade_specialty, only: [:show, :edit, :update, :destroy]

  # GET /school_grade_specialties
  # GET /school_grade_specialties.json
  def index
    @school_grade_specialties = SchoolGradeSpecialty.all
  end

  # GET /school_grade_specialties/1
  # GET /school_grade_specialties/1.json
  def show
  end

  # GET /school_grade_specialties/new
  def new
    @school_grade_specialty = SchoolGradeSpecialty.new
  end

  # GET /school_grade_specialties/1/edit
  def edit
  end

  # POST /school_grade_specialties
  # POST /school_grade_specialties.json
  def create
    @school_grade_specialty = SchoolGradeSpecialty.new(school_grade_specialty_params)

    respond_to do |format|
      if @school_grade_specialty.save
        format.html { redirect_to @school_grade_specialty, notice: 'School grade specialty was successfully created.' }
        format.json { render :show, status: :created, location: @school_grade_specialty }
      else
        format.html { render :new }
        format.json { render json: @school_grade_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_grade_specialties/1
  # PATCH/PUT /school_grade_specialties/1.json
  def update
    respond_to do |format|
      if @school_grade_specialty.update(school_grade_specialty_params)
        format.html { redirect_to @school_grade_specialty, notice: 'School grade specialty was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_grade_specialty }
      else
        format.html { render :edit }
        format.json { render json: @school_grade_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_grade_specialties/1
  # DELETE /school_grade_specialties/1.json
  def destroy
    @school_grade_specialty.destroy
    respond_to do |format|
      format.html { redirect_to school_grade_specialties_url, notice: 'School grade specialty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_grade_specialty
      @school_grade_specialty = SchoolGradeSpecialty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_grade_specialty_params
      params.require(:school_grade_specialty).permit(:code, :description, :school_grade_id)
    end
end
