class StudentBusCardsController < ApplicationController
  before_action :set_student_bus_card, only: [:show, :edit, :update, :destroy]

  # GET /student_bus_cards
  # GET /student_bus_cards.json
  def index
    @student_bus_cards = StudentBusCard.all
  end

  # GET /student_bus_cards/1
  # GET /student_bus_cards/1.json
  def show
  end

  # GET /student_bus_cards/new
  def new
    @student_bus_card = StudentBusCard.new
  end

  # GET /student_bus_cards/1/edit
  def edit
  end

  # POST /student_bus_cards
  # POST /student_bus_cards.json
  def create
    @student_bus_card = StudentBusCard.new(student_bus_card_params)

    respond_to do |format|
      if @student_bus_card.save
        format.html { redirect_to @student_bus_card, notice: 'Student bus card was successfully created.' }
        format.json { render :show, status: :created, location: @student_bus_card }
      else
        format.html { render :new }
        format.json { render json: @student_bus_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_bus_cards/1
  # PATCH/PUT /student_bus_cards/1.json
  def update
    respond_to do |format|
      if @student_bus_card.update(student_bus_card_params)
        format.html { redirect_to @student_bus_card, notice: 'Student bus card was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_bus_card }
      else
        format.html { render :edit }
        format.json { render json: @student_bus_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_bus_cards/1
  # DELETE /student_bus_cards/1.json
  def destroy
    @student_bus_card.destroy
    respond_to do |format|
      format.html { redirect_to student_bus_cards_url, notice: 'Student bus card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_bus_card
      @student_bus_card = StudentBusCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_bus_card_params
      params.fetch(:student_bus_card, {})
    end
end
