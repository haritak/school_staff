class SchoolTeacherRequestsController < ApplicationController
  before_action :set_school_teacher_request, 
    only: [:show, :edit, :update, :destroy, :add_support_document]

  def apply_new
    school_teacher_id = params[ :school_teacher_id ]
    request_specification_id = params[ :request_specification_id ]

    @school_teacher = SchoolTeacher.find( school_teacher_id )
    @request_specification = RequestSpecification.find( request_specification_id )
  end

  def add_support_document
    support_document = RequestSupportDocument.create( school_teacher_request: @school_teacher_request )
    redirect_to edit_request_support_document_path( support_document )
  end

  def create_request
    school_teacher_id = params[ :school_teacher_id ]
    request_specification_id = params[ :request_specification_id ]

    starting_date = Date.parse(params[ :start_date ][ :start_date ])
    start_date_str = starting_date.strftime( "%d/%m/%y" )
    duration = params[ :duration ][ :duration ].to_i

    school_teacher = SchoolTeacher.find( school_teacher_id )
    request_specification = RequestSpecification.find( request_specification_id )

    specialty = 
      school_teacher.teacher.teacher_specialties[0].specialty.code + "-" +
      school_teacher.teacher.teacher_specialties[0].specialty.description

    last_name = school_teacher.teacher.person.last_name
    first_name = school_teacher.teacher.person.first_name
    gender = school_teacher.teacher.person.gender
    applicant = "Ο Αιτών"
    applicant = "Η Αιτούσα" if gender == 1 #female

    duration_str = "#{duration} ημέρες"
    duration_str = "1 ημέρα" if duration == 1

    end_date = starting_date
    count = duration
    (count -= 1).times do 
      end_date += 1
      end_date += 2 if end_date.saturday? 
    end

    end_date_str = end_date.strftime( "%d/%m/%y" )

    template_filename = request_specification.static_filename
    if not template_filename
      template_filename = request_specification.template_filename
    end

    report = ODFReport::Report.new( template_filename ) do | r |
      r.add_field :last_name, last_name
      r.add_field :first_name, first_name
      r.add_field :father_name, school_teacher.teacher.person.father_name
      r.add_field :specialty, specialty
      r.add_field :primary_school, school_teacher.teacher.school.title
      r.add_field :serving_school, school_teacher.school.title
      r.add_field :home_address, school_teacher.teacher.person.home_address
      r.add_field :mobile_phone, school_teacher.teacher.person.mobile_phone

      r.add_field :start_date, start_date_str
      r.add_field :end_date, end_date_str
      r.add_field :duration, duration_str

      r.add_field :applicant, applicant
    end

    filename = Time.now.strftime "%Y%m%d%H%M%S-#{last_name}-#{first_name}"
    filename = Rails.root.join "../tmp/responses/#{filename}.odt"
    report.generate( filename )

    new_request = SchoolTeacherRequest.create(
      school_teacher: school_teacher,
      request_specification: request_specification,
      filename: filename,
      starting_date: starting_date,
      duration: duration
    )

    StaffMailer.inform_applicant( new_request ).deliver_later
    StaffMailer.inform_manager( new_request ).deliver_later
    StaffMailer.inform_other( new_request ).deliver_later

    redirect_to history_of_requests_path(school_teacher)
  end

  def download
    school_teacher_request_id = params[ :school_teacher_request ]
    school_teacher_request = SchoolTeacherRequest.find( school_teacher_request_id )

    send_file school_teacher_request.filename
  end

  def history
    school_teacher_id = params[ :school_teacher_id ]
    school_teacher = SchoolTeacher.find( school_teacher_id )
    @school_teacher_requests = SchoolTeacherRequest.where(school_teacher: school_teacher)
  end

  # GET /school_teacher_requests
  # GET /school_teacher_requests.json
  def index(school_teacher = nil)
    @school_teacher_requests = SchoolTeacherRequest.all
  end

  # GET /school_teacher_requests/1
  # GET /school_teacher_requests/1.json
  def show
    @history_of_similar = 
      SchoolTeacherRequest.where( school_teacher: @school_teacher_request.school_teacher,
                                 request_specification: @school_teacher_request.request_specification )
    @history = 
      SchoolTeacherRequest.where( school_teacher: @school_teacher_request.school_teacher)
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
      params.require(:school_teacher_request).permit(:school_teacher_id, 
                                                     :request_specification_id, 
                                                     :filename,
                                                     :starting_date,
                                                     :duration
                                                    )
    end
end
