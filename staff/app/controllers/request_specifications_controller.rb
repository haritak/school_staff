class RequestSpecificationsController < ApplicationController
  before_action :set_request_specification, only: [:show, :edit, :update, :destroy]

  # GET /request_specifications
  # GET /request_specifications.json
  def index
    @request_specifications = RequestSpecification.all
  end

  # GET /request_specifications/1
  # GET /request_specifications/1.json
  def show
  end

  # GET /request_specifications/new
  def new
    @request_specification = RequestSpecification.new
  end

  # GET /request_specifications/1/edit
  def edit
  end

  # POST /request_specifications
  # POST /request_specifications.json
  def create
    @request_specification = RequestSpecification.new(request_specification_params)

    respond_to do |format|
      if @request_specification.save
        format.html { redirect_to @request_specification, notice: 'Request specification was successfully created.' }
        format.json { render :show, status: :created, location: @request_specification }
      else
        format.html { render :new }
        format.json { render json: @request_specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_specifications/1
  # PATCH/PUT /request_specifications/1.json
  def update
    respond_to do |format|
      if @request_specification.update(request_specification_params)
        format.html { redirect_to @request_specification, notice: 'Request specification was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_specification }
      else
        format.html { render :edit }
        format.json { render json: @request_specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_specifications/1
  # DELETE /request_specifications/1.json
  def destroy
    @request_specification.destroy
    respond_to do |format|
      format.html { redirect_to request_specifications_url, notice: 'Request specification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_specification
      @request_specification = RequestSpecification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_specification_params
      params.require(:request_specification).permit(:request_type, 
                                                    :request_description, 
                                                    :request_spec_reference, 
                                                    :teacher_working_class_id, 
                                                    :template_filename,
                                                    :remove_template,
                                                    :uploaded_template
                                                   )
    end
end
