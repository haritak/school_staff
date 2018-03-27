class RequestSupportDocumentsController < ApplicationController
  before_action :set_request_support_document, only: [:show, :edit, :update, :destroy]

  # GET /request_support_documents
  # GET /request_support_documents.json
  def index
    @request_support_documents = RequestSupportDocument.all
  end

  # GET /request_support_documents/1
  # GET /request_support_documents/1.json
  def show
  end

  # GET /request_support_documents/new
  def new
    @request_support_document = RequestSupportDocument.new
  end

  # GET /request_support_documents/1/edit
  def edit
  end

  # POST /request_support_documents
  # POST /request_support_documents.json
  def create
    @request_support_document = RequestSupportDocument.new(request_support_document_params)

    respond_to do |format|
      if @request_support_document.save
        format.html { redirect_to @request_support_document, notice: 'Request support document was successfully created.' }
        format.json { render :show, status: :created, location: @request_support_document }
      else
        format.html { render :new }
        format.json { render json: @request_support_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_support_documents/1
  # PATCH/PUT /request_support_documents/1.json
  def update
    respond_to do |format|
      if @request_support_document.update(request_support_document_params)
        #format.html { redirect_to @request_support_document, notice: 'Request support document was successfully updated.' }
        format.html { redirect_to @request_support_document.
                      school_teacher_request.
                      school_teacher_response, notice: 'Request support document was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_support_document }
      else
        format.html { render :edit }
        format.json { render json: @request_support_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_support_documents/1
  # DELETE /request_support_documents/1.json
  def destroy
    @request_support_document.destroy
    respond_to do |format|
      #format.html { redirect_to request_support_documents_url, notice: 'Request support document was successfully destroyed.' }
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_support_document
      @request_support_document = RequestSupportDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_support_document_params
      params.require(:request_support_document).permit(:school_teacher_request_id, :order, :issuer, :issuer_protocol, :issuer_date, :description)
    end
end
