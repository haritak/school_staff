class ResponseSpecificationsController < ApplicationController
  before_action :set_response_specification, only: [:show, :edit, :update, :destroy]

  # GET /response_specifications
  # GET /response_specifications.json
  def index
    @response_specifications = ResponseSpecification.all
  end

  # GET /response_specifications/1
  # GET /response_specifications/1.json
  def show
  end

  # GET /response_specifications/new
  def new
    @response_specification = ResponseSpecification.new
  end

  # GET /response_specifications/1/edit
  def edit
  end

  # POST /response_specifications
  # POST /response_specifications.json
  def create
    @response_specification = ResponseSpecification.new(response_specification_params)

    respond_to do |format|
      if @response_specification.save
        format.html { redirect_to @response_specification, notice: 'Response specification was successfully created.' }
        format.json { render :show, status: :created, location: @response_specification }
      else
        format.html { render :new }
        format.json { render json: @response_specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /response_specifications/1
  # PATCH/PUT /response_specifications/1.json
  def update
    respond_to do |format|
      if @response_specification.update(response_specification_params)
        format.html { redirect_to @response_specification, notice: 'Response specification was successfully updated.' }
        format.json { render :show, status: :ok, location: @response_specification }
      else
        format.html { render :edit }
        format.json { render json: @response_specification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /response_specifications/1
  # DELETE /response_specifications/1.json
  def destroy
    @response_specification.destroy
    respond_to do |format|
      format.html { redirect_to response_specifications_url, notice: 'Response specification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response_specification
      @response_specification = ResponseSpecification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_specification_params
      params.require(:response_specification).permit(:request_specification_id, 
                                                     :template_filename,
                                                     :uploaded_template,
                                                    )
    end
end
