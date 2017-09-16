class StudentPersonalMobilesController < ApplicationController
  before_action :set_student_personal_mobile, only: [:show, :edit, :update, :destroy]

  # GET /student_personal_mobiles
  # GET /student_personal_mobiles.json
  def index
    @student_personal_mobiles = StudentPersonalMobile.all
  end

  # GET /student_personal_mobiles/1
  # GET /student_personal_mobiles/1.json
  def show
  end

  # GET /student_personal_mobiles/new
  def new
    @student_personal_mobile = StudentPersonalMobile.new
  end

  # GET /student_personal_mobiles/1/edit
  def edit
  end

  # POST /student_personal_mobiles
  # POST /student_personal_mobiles.json
  def create
    @student_personal_mobile = StudentPersonalMobile.new(student_personal_mobile_params)

    respond_to do |format|
      if @student_personal_mobile.save
        format.html { redirect_to @student_personal_mobile, notice: 'Student personal mobile was successfully created.' }
        format.json { render :show, status: :created, location: @student_personal_mobile }
      else
        format.html { render :new }
        format.json { render json: @student_personal_mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_personal_mobiles/1
  # PATCH/PUT /student_personal_mobiles/1.json
  def update
    respond_to do |format|
      if @student_personal_mobile.update(student_personal_mobile_params)
        format.html { redirect_to @student_personal_mobile, notice: 'Student personal mobile was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_personal_mobile }
      else
        format.html { render :edit }
        format.json { render json: @student_personal_mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_personal_mobiles/1
  # DELETE /student_personal_mobiles/1.json
  def destroy
    @student_personal_mobile.destroy
    respond_to do |format|
      format.html { redirect_to student_personal_mobiles_url, notice: 'Student personal mobile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_personal_mobile
      @student_personal_mobile = StudentPersonalMobile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_personal_mobile_params
      params.fetch(:student_personal_mobile, {})
    end
end
