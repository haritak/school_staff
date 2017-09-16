class StudentParentMobilesController < ApplicationController
  before_action :set_student_parent_mobile, only: [:show, :edit, :update, :destroy]

  # GET /student_parent_mobiles
  # GET /student_parent_mobiles.json
  def index
    @student_parent_mobiles = StudentParentMobile.all
  end

  # GET /student_parent_mobiles/1
  # GET /student_parent_mobiles/1.json
  def show
  end

  # GET /student_parent_mobiles/new
  def new
    @student_parent_mobile = StudentParentMobile.new
  end

  # GET /student_parent_mobiles/1/edit
  def edit
  end

  # POST /student_parent_mobiles
  # POST /student_parent_mobiles.json
  def create
    @student_parent_mobile = StudentParentMobile.new(student_parent_mobile_params)

    respond_to do |format|
      if @student_parent_mobile.save
        format.html { redirect_to @student_parent_mobile, notice: 'Student parent mobile was successfully created.' }
        format.json { render :show, status: :created, location: @student_parent_mobile }
      else
        format.html { render :new }
        format.json { render json: @student_parent_mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_parent_mobiles/1
  # PATCH/PUT /student_parent_mobiles/1.json
  def update
    respond_to do |format|
      if @student_parent_mobile.update(student_parent_mobile_params)
        format.html { redirect_to @student_parent_mobile, notice: 'Student parent mobile was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_parent_mobile }
      else
        format.html { render :edit }
        format.json { render json: @student_parent_mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_parent_mobiles/1
  # DELETE /student_parent_mobiles/1.json
  def destroy
    @student_parent_mobile.destroy
    respond_to do |format|
      format.html { redirect_to student_parent_mobiles_url, notice: 'Student parent mobile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_parent_mobile
      @student_parent_mobile = StudentParentMobile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_parent_mobile_params
      params.fetch(:student_parent_mobile, {})
    end
end
