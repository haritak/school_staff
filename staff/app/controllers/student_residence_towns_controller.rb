class StudentResidenceTownsController < ApplicationController
  before_action :set_student_residence_town, only: [:show, :edit, :update, :destroy]

  # GET /student_residence_towns
  # GET /student_residence_towns.json
  def index
    @student_residence_towns = StudentResidenceTown.all
  end

  # GET /student_residence_towns/1
  # GET /student_residence_towns/1.json
  def show
  end

  # GET /student_residence_towns/new
  def new
    @student_residence_town = StudentResidenceTown.new
  end

  # GET /student_residence_towns/1/edit
  def edit
  end

  # POST /student_residence_towns
  # POST /student_residence_towns.json
  def create
    @student_residence_town = StudentResidenceTown.new(student_residence_town_params)

    respond_to do |format|
      if @student_residence_town.save
        format.html { redirect_to @student_residence_town, notice: 'Student residence town was successfully created.' }
        format.json { render :show, status: :created, location: @student_residence_town }
      else
        format.html { render :new }
        format.json { render json: @student_residence_town.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_residence_towns/1
  # PATCH/PUT /student_residence_towns/1.json
  def update
    respond_to do |format|
      if @student_residence_town.update(student_residence_town_params)
        format.html { redirect_to @student_residence_town, notice: 'Student residence town was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_residence_town }
      else
        format.html { render :edit }
        format.json { render json: @student_residence_town.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_residence_towns/1
  # DELETE /student_residence_towns/1.json
  def destroy
    @student_residence_town.destroy
    respond_to do |format|
      format.html { redirect_to student_residence_towns_url, notice: 'Student residence town was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_residence_town
      @student_residence_town = StudentResidenceTown.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_residence_town_params
      params.fetch(:student_residence_town, {})
    end
end
