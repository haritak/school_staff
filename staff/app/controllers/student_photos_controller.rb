class StudentPhotosController < ApplicationController
  before_action :set_student_photo, only: [:show, :edit, :update, :destroy]

  # GET /student_photos
  # GET /student_photos.json
  def index
    @student_photos = StudentPhoto.all
  end

  # GET /student_photos/1
  # GET /student_photos/1.json
  def show
  end

  # GET /student_photos/new
  def new
    @student_photo = StudentPhoto.new
  end

  # GET /student_photos/1/edit
  def edit
  end

  # POST /student_photos
  # POST /student_photos.json
  def create
    @student_photo = StudentPhoto.new(student_photo_params)

    respond_to do |format|
      if @student_photo.save
        format.html { redirect_to @student_photo, notice: 'Student photo was successfully created.' }
        format.json { render :show, status: :created, location: @student_photo }
      else
        format.html { render :new }
        format.json { render json: @student_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_photos/1
  # PATCH/PUT /student_photos/1.json
  def update
    respond_to do |format|
      if @student_photo.update(student_photo_params)
        format.html { redirect_to @student_photo, notice: 'Student photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_photo }
      else
        format.html { render :edit }
        format.json { render json: @student_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_photos/1
  # DELETE /student_photos/1.json
  def destroy
    @student_photo.destroy
    respond_to do |format|
      format.html { redirect_to student_photos_url, notice: 'Student photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_photo
      @student_photo = StudentPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_photo_params
      params.require(:student_photo).permit(:student_id, :filename, :type)
    end
end
