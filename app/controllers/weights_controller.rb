class WeightsController < ApplicationController
	before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @weights = @user.weights
  end

  def show
    @weight = Weight.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @weight }
   end
  end

  def new
  	@weight = current_user.weights.new

    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @weight }
    end
  end

  def destroy
  	@weight = Weight.find(params[:id])
  	@user = @weight.user
    @weight.destroy
    redirect_to user_weights_path(@weight.user), :notice => "Successfully destroyed weight."
  end

  def create
   @weight = current_user.weights.new( weight_params)

    respond_to do |format|
      if @weight.save
        format.html { redirect_to user_weights_path(@weight.user), notice: 'Status was successfully created.' }
        format.json { render json: @weight, status: :created, location: @weight }
      else
        format.html { render action: "new" }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def weight_params
  	params.require(:weight).permit(:amount)
  end
end
