class SchoolTeacherRequestsController < ApplicationController
  before_action :set_school_teacher_request, only: [:show, :edit, :update, :destroy]

  def apply_new
    school_teacher_id = params[ :school_teacher_id ]
    request_specification_id = params[ :request_specification_id ]

    school_teacher = SchoolTeacher.find( school_teacher_id )
    request_specification = RequestSpecification.find( request_specification_id )

    report = ODFReport::Report.new( request_specification.template_filename ) do | r |
      r.add_field :last_name, school_teacher.teacher.person.last_name
      r.add_field :first_name, school_teacher.teacher.person.first_name
      r.add_field :father_name, school_teacher.teacher.person.father_name
      r.add_field :specialty, school_teacher.teacher.teacher_specialties[0].specialty.description
      r.add_field :primary_school, school_teacher.teacher.school.title
      r.add_field :serving_school, "_________"
      r.add_field :serving_school_gen, "__________"
      r.add_field :home_address, school_teacher.teacher.person.home_address
      r.add_field :mobile_phone, school_teacher.teacher.person.mobile_phone
    end

    filename = Time.now.strftime "%Y%m%d%H%M%S"
    report.generate( Rails.root.join "../tmp/responses/#{filename}.odt" )

    send_file ( "../tmp/responses/#{filename}.odt" )
  end

  # GET /school_teacher_requests
  # GET /school_teacher_requests.json
  def index
    @school_teacher_requests = SchoolTeacherRequest.all
  end

  # GET /school_teacher_requests/1
  # GET /school_teacher_requests/1.json
  def show
  end

  # GET /school_teacher_requests/new
  def new
    @school_teacher_request = SchoolTeacherRequest.new
  end

  # GET /school_teacher_requests/1/edit
  def edit
  end

  # POST /school_teacher_requests
  # POST /school_teacher_requests.json
  def create
    @school_teacher_request = SchoolTeacherRequest.new(school_teacher_request_params)

    respond_to do |format|
      if @school_teacher_request.save
        format.html { redirect_to @school_teacher_request, notice: 'School teacher request was successfully created.' }
        format.json { render :show, status: :created, location: @school_teacher_request }
      else
        format.html { render :new }
        format.json { render json: @school_teacher_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_teacher_requests/1
  # PATCH/PUT /school_teacher_requests/1.json
  def update
    respond_to do |format|
      if @school_teacher_request.update(school_teacher_request_params)
        format.html { redirect_to @school_teacher_request, notice: 'School teacher request was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_teacher_request }
      else
        format.html { render :edit }
        format.json { render json: @school_teacher_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_teacher_requests/1
  # DELETE /school_teacher_requests/1.json
  def destroy
    @school_teacher_request.destroy
    respond_to do |format|
      format.html { redirect_to school_teacher_requests_url, notice: 'School teacher request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_teacher_request
      @school_teacher_request = SchoolTeacherRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_teacher_request_params
      params.require(:school_teacher_request).permit(:school_teacher_id, :request_specification_id, :filename)
    end
end
