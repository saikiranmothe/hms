class KoMedicationsController < ApplicationController
  before_action :set_ko_medication, only: [:show, :edit, :update, :destroy]

  # GET /colusseums
  # GET /colusseums.json
  def index
    @ko_medications = KoMedication.all
  end

  # GET /colusseums/1
  # GET /colusseums/1.json
  def show
  end

  # GET /colusseums/new
  def new
    @ko_medication = KoMedication.new
  end

  # GET /colusseums/1/edit
  def edit
  end

  # POST /colusseums
  # POST /colusseums.json
  def create
    @ko_medication = KoMedication.new(ko_medication_params)

    respond_to do |format|
      if @ko_medication.save
        format.html { redirect_to @ko_medication, notice: 'KoMedication was successfully created.' }
        format.json { render :show, status: :created, location: @ko_medication }
      else
        format.html { render :new }
        format.json { render json: @ko_medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ko_medications/1
  # PATCH/PUT /ko_medications/1.json
  def update
    respond_to do |format|
      if @ko_medication.update(ko_medication_params)
        format.html { redirect_to @ko_medication, notice: 'KoMedication was successfully updated.' }
        format.json { render :show, status: :ok, location: @ko_medication }
      else
        format.html { render :edit }
        format.json { render json: @ko_medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ko_medications/1
  # DELETE /ko_medications/1.json
  def destroy
    @ko_medication.destroy
    respond_to do |format|
      format.html { redirect_to ko_medications_url, notice: 'KoMedication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ko_medication
      @ko_medication = KoMedication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ko_medication_params
      params.require(:ko_medication).permit(:name, :description, :imageurl)
    end
end
