class HeightsController < ApplicationController
	before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @heights = @user.heights
  end

  def show
    @height = Height.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @height }
   end
  end

  def new
  	@height = current_user.heights.new

    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @height }
    end
  end

  def destroy
  	@height = Height.find(params[:id])
  	@user = @height.user
    @height.destroy
    redirect_to user_heights_path(@height.user), :notice => "Successfully destroyed height."
  end

  def create
   @height = current_user.heights.new( height_params)

    respond_to do |format|
      if @height.save
        format.html { redirect_to user_heights_path(@height.user), notice: 'Status was successfully created.' }
        format.json { render json: @height, status: :created, location: @height }
      else
        format.html { render action: "new" }
        format.json { render json: @height.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def height_params
  	params.require(:height).permit(:amount)
  end
end
