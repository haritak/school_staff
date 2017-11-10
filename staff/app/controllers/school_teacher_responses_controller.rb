class SchoolTeacherResponsesController < ApplicationController
  before_action :set_school_teacher_response, only: [:show, :edit, :update, :destroy]

  # GET /school_teacher_responses
  # GET /school_teacher_responses.json
  def index
    @open_school_teacher_requests = SchoolTeacherRequest.find_by_sql("select * from school_teacher_requests "+
                                                                     "where id not in "+
                                                                     "(select school_teacher_request_id from school_teacher_responses);")
    @school_teacher_responses = SchoolTeacherResponse.all
    @school_teacher_responses_with_decision_files = SchoolTeacherResponse.joins(:decision_file)
    @open_school_teacher_responses = @school_teacher_responses - @school_teacher_responses_with_decision_files
  end

  # GET /school_teacher_responses/1
  # GET /school_teacher_responses/1.json
  def show
    @request_support_documents = 
      RequestSupportDocument.where( school_teacher_request: 
                                   @school_teacher_response.school_teacher_request ).order( :order )
  end

  # GET /school_teacher_responses/new
  def new
    @school_teacher_response = SchoolTeacherResponse.new
  end

  # GET /school_teacher_responses/1/edit
  def edit
  end

  # POST /school_teacher_responses
  # POST /school_teacher_responses.json
  def create
    @school_teacher_response = SchoolTeacherResponse.new(school_teacher_response_params)

    respond_to do |format|
      if @school_teacher_response.save
        format.html { redirect_to @school_teacher_response, notice: 'School teacher response was successfully created.' }
        format.json { render :show, status: :created, location: @school_teacher_response }
      else
        format.html { render :new }
        format.json { render json: @school_teacher_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_teacher_responses/1
  # PATCH/PUT /school_teacher_responses/1.json
  def update
    respond_to do |format|
      if @school_teacher_response.update(school_teacher_response_params)
        format.html { redirect_to @school_teacher_response, notice: 'School teacher response was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_teacher_response }
      else
        format.html { render :edit }
        format.json { render json: @school_teacher_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_teacher_responses/1
  # DELETE /school_teacher_responses/1.json
  def destroy
    @school_teacher_response.destroy
    respond_to do |format|
      format.html { redirect_to school_teacher_responses_url, notice: 'School teacher response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_teacher_response
      @school_teacher_response = SchoolTeacherResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_teacher_response_params
      params.require(:school_teacher_response).permit(:school_teacher_request_id, :decision_no, :decision_year, :protocol_no, :protocol_date, :decision_duration, :decision_starting_date, :comments, :response_completed)
    end
end
