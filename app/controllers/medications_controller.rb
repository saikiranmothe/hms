class MedicationsController < ApplicationController
	before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @medications = @user.medications
  end

  def show
    @medication = Medication.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @medication }
   end
  end

  def edit
    @medication = Medication.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @medication }
   end
  end

  def new
  	@medication = current_user.medications.new

    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @medication }
    end
  end

  def destroy
  	@medication = Medication.find(params[:id])
  	@user = @medication.user
    @medication.destroy
    redirect_to user_medications_path(@medication.user), flash: { info: "Successfully destroyed medication."}
  end

  def create
   @medication = current_user.medications.new( medication_params)

    respond_to do |format|
      if @medication.save
        format.html { redirect_to user_medications_path(@medication.user), notice: 'Medication was successfully created.' }
        format.json { render json: @medication, status: :created, location: @medication }
      else
        format.html { render action: "new" }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def medication_params
  	params.require(:medication).permit(:user_id, :name, :dosage)
  end
end
