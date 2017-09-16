class StudentContactInfosController < ApplicationController
  before_action :set_student_contact_info, only: [:show, :edit, :update, :destroy]

  # GET /student_contact_infos
  # GET /student_contact_infos.json
  def index
    @student_contact_infos = StudentContactInfo.all
  end

  # GET /student_contact_infos/1
  # GET /student_contact_infos/1.json
  def show
  end

  # GET /student_contact_infos/new
  def new
    @student_contact_info = StudentContactInfo.new
  end

  # GET /student_contact_infos/1/edit
  def edit
  end

  # POST /student_contact_infos
  # POST /student_contact_infos.json
  def create
    @student_contact_info = StudentContactInfo.new(student_contact_info_params)

    respond_to do |format|
      if @student_contact_info.save
        format.html { redirect_to @student_contact_info, notice: 'Student contact info was successfully created.' }
        format.json { render :show, status: :created, location: @student_contact_info }
      else
        format.html { render :new }
        format.json { render json: @student_contact_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_contact_infos/1
  # PATCH/PUT /student_contact_infos/1.json
  def update
    respond_to do |format|
      if @student_contact_info.update(student_contact_info_params)
        format.html { redirect_to @student_contact_info, notice: 'Student contact info was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_contact_info }
      else
        format.html { render :edit }
        format.json { render json: @student_contact_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_contact_infos/1
  # DELETE /student_contact_infos/1.json
  def destroy
    @student_contact_info.destroy
    respond_to do |format|
      format.html { redirect_to student_contact_infos_url, notice: 'Student contact info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_contact_info
      @student_contact_info = StudentContactInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_contact_info_params
      params.require(:student_contact_info).permit(:student_id, :info, :type)
    end
end
