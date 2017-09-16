class StudentResidenceAddressesController < ApplicationController
  before_action :set_student_residence_address, only: [:show, :edit, :update, :destroy]

  # GET /student_residence_addresses
  # GET /student_residence_addresses.json
  def index
    @student_residence_addresses = StudentResidenceAddress.all
  end

  # GET /student_residence_addresses/1
  # GET /student_residence_addresses/1.json
  def show
  end

  # GET /student_residence_addresses/new
  def new
    @student_residence_address = StudentResidenceAddress.new
  end

  # GET /student_residence_addresses/1/edit
  def edit
  end

  # POST /student_residence_addresses
  # POST /student_residence_addresses.json
  def create
    @student_residence_address = StudentResidenceAddress.new(student_residence_address_params)

    respond_to do |format|
      if @student_residence_address.save
        format.html { redirect_to @student_residence_address, notice: 'Student residence address was successfully created.' }
        format.json { render :show, status: :created, location: @student_residence_address }
      else
        format.html { render :new }
        format.json { render json: @student_residence_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_residence_addresses/1
  # PATCH/PUT /student_residence_addresses/1.json
  def update
    respond_to do |format|
      if @student_residence_address.update(student_residence_address_params)
        format.html { redirect_to @student_residence_address, notice: 'Student residence address was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_residence_address }
      else
        format.html { render :edit }
        format.json { render json: @student_residence_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_residence_addresses/1
  # DELETE /student_residence_addresses/1.json
  def destroy
    @student_residence_address.destroy
    respond_to do |format|
      format.html { redirect_to student_residence_addresses_url, notice: 'Student residence address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_residence_address
      @student_residence_address = StudentResidenceAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_residence_address_params
      params.fetch(:student_residence_address, {})
    end
end
