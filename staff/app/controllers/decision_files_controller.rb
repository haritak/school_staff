class DecisionFilesController < ApplicationController
  before_action :set_decision_file, only: [:show, :edit, :update, :destroy]

  def create_decision_files
    school_teacher_response = 
      SchoolTeacherResponse.find( params[ :school_teacher_response ])

    teacher_request = school_teacher_response.school_teacher_request
    teacher = teacher_request.school_teacher.teacher
    person = teacher.person
    request_spec = teacher_request.request_specification

    response_specification = ResponseSpecification.find_by( request_specification:
                                                           request_spec )

    support_documents = RequestSupportDocument.where( school_teacher_request:
                                                       teacher_request ).order( :order ).to_a
    extra_document_1 = extra_document_2 = extra_document_3 = extra_document_4 = ""
    if support_documents.length>0
      extra_document_1 = "5. #{support_documents[0].to_s}" if support_documents.length>0
      extra_document_2 = "6. #{support_documents[1].to_s}" if support_documents.length>1
      extra_document_3 = "7. #{support_documents[2].to_s}" if support_documents.length>2
      extra_document_4 = "8. #{support_documents[3].to_s}" if support_documents.length>3
    end

    last_name = teacher.person.last_name
    first_name = teacher.person.first_name
    father_name = teacher.person.father_name
    request_code = request_spec.code
    date_str = teacher_request.starting_date.strftime "%d-%m-%Y"

    specialty = 
      teacher.teacher_specialties[0].specialty.code + "-" +
      teacher.teacher_specialties[0].specialty.description

    duration_str = "μία(1) ημέρα"
    if teacher_request.duration > 1
      duration_str = "#{teacher_request.duration} ημέρες"
    end
    starting_date_str = teacher_request.starting_date.strftime( "%d/%m/%y" )
    end_date = teacher_request.starting_date
    count = teacher_request.duration
    (count -= 1).times do 
      end_date += 1

      #τα Σ/Κ δεν μετράνε σε κάποιες άδειες, αλλά μετράνε σε άλλες.
      #Οπότε εδώ μπήκε ένας απλός τρόπος απόφασης.
      #Αν η άδεια είναι μικρή (<=8 ημερών), τότε τα ΣΚ δεν μετράνε.
      #αλλιώς μετράνε κανονικά.
      end_date += 2 if end_date.saturday? and teacher_request.duration <= 8
    end
    ending_date_str = end_date.strftime( "%d/%m/%y" )
  

    toy = "του"
    ston = "στον"
    anapliroti = "αναπληρωτή" #σε ...
    anapliroti_gen = "αναπληρωτή" #του/της ...
    if teacher.person.gender==1
      toy = "της"
      ston = "στην"
      anapliroti = "αναπληρώτρια"
      anapliroti_gen = "αναπληρώτριας" #του/της ...
    end

    template_filename = response_specification.static_filename
    if not template_filename or not File.exist?( template_filename )
      template_filename = response_specification.template_filename
    end
    report = ODFReport::Report.new( template_filename ) do | r |
      r.add_field :pd, school_teacher_response.protocol_date.strftime( "%d" )
      r.add_field :pm, school_teacher_response.protocol_date.strftime( "%m" )
      r.add_field :py, school_teacher_response.protocol_date.strftime( "%Y" )
      r.add_field :pno, school_teacher_response.protocol_no
      r.add_field :dno, school_teacher_response.decision_no
      r.add_field :dy, school_teacher_response.decision_year

      r.add_field :date_of_request, teacher_request.created_at.strftime( "%d/%m/%Y" )
      r.add_field :protocol_of_request, school_teacher_response.protocol_no
      r.add_field :toy, toy
      r.add_field :last_name_gen, person.geniki( :last_name )
      r.add_field :first_name_gen, person.geniki( :first_name )
      r.add_field :father_name_gen, person.geniki( :father_name, 0 )
      r.add_field :specialty, specialty

      r.add_field :ston, ston
      r.add_field :last_name_ait, person.aitiatiki( :last_name )
      r.add_field :first_name_ait, person.aitiatiki( :first_name )
      r.add_field :father_name_gen, person.aitiatiki( :father_name, 0 )
      r.add_field :specialty, specialty

      r.add_field :days_duration, duration_str
      r.add_field :starting_date, starting_date_str
      r.add_field :ending_date, ending_date_str

      r.add_field :manager, "ο Διευθυντής"
      r.add_field :manager_full_name, "Αρβανιτάκης Ιωάννης"

      r.add_field :extra_document_1, extra_document_1
      r.add_field :extra_document_2, extra_document_2
      r.add_field :extra_document_3, extra_document_3
      r.add_field :extra_document_4, extra_document_4

      r.add_field :anapliroti, anapliroti
      r.add_field :anapliroti_gen, anapliroti_gen
    end

    filename = Time.now.strftime "#{last_name}_#{first_name}_#{request_code} #{date_str} %Y%m%d%H%M%S"
    filename = Rails.root.join "../tmp/decisions/#{filename}.odt"
    report.generate( filename )

    target = "γενική φόρμα"
    DecisionFile.create(
      school_teacher_response: school_teacher_response,
      filename: filename,
      target: target,
    )

    redirect_to decision_files_url
  end

  def download
    decision_file = DecisionFile.find( params[ :decision_file ] )

    send_file decision_file.filename
  end

  # GET /decision_files
  # GET /decision_files.json
  def index
    @decision_files = DecisionFile.all
  end

  # GET /decision_files/1
  # GET /decision_files/1.json
  def show
  end

  # GET /decision_files/new
  def new
    @decision_file = DecisionFile.new
  end

  # GET /decision_files/1/edit
  def edit
  end

  # POST /decision_files
  # POST /decision_files.json
  def create
    @decision_file = DecisionFile.new(decision_file_params)

    respond_to do |format|
      if @decision_file.save
        format.html { redirect_to @decision_file, notice: 'Decision file was successfully created.' }
        format.json { render :show, status: :created, location: @decision_file }
      else
        format.html { render :new }
        format.json { render json: @decision_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decision_files/1
  # PATCH/PUT /decision_files/1.json
  def update
    respond_to do |format|
      if @decision_file.update(decision_file_params)
        format.html { redirect_to @decision_file, notice: 'Decision file was successfully updated.' }
        format.json { render :show, status: :ok, location: @decision_file }
      else
        format.html { render :edit }
        format.json { render json: @decision_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decision_files/1
  # DELETE /decision_files/1.json
  def destroy
    @decision_file.destroy
    respond_to do |format|
      format.html { redirect_to decision_files_url, notice: 'Decision file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decision_file
      @decision_file = DecisionFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decision_file_params
      params.require(:decision_file).permit(:school_teacher_response_id, :filename, :target)
    end
end
