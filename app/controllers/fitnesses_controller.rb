class FitnessesController < ApplicationController
	before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @fitnesses = @user.fitnesses

    if current_user.id == @user.id
			render action: :index
		else
			render file: 'public/denied'
		end
  end

  def show
    @fitness = Fitness.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @fitness }
   end

   if current_user.id == @user.id
			render action: :show
		else
			render file: 'public/denied'
		end
  end

  def new
  	@fitness = current_user.fitnesses.new

    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @fitness }
    end
  end

  def destroy
  	@fitness = Fitness.find(params[:id])
  	@user = @fitness.user
    @fitness.destroy
    redirect_to user_fitnesses_path(@fitness.user), :notice => "Successfully destroyed fitness."
  end

  def create
   @fitness = current_user.fitnesses.new( fitness_params)

    respond_to do |format|
      if @fitness.save
        format.html { redirect_to user_fitnesses_path(@fitness.user), notice: 'Fitness was successfully created.' }
        format.json { render json: @fitness, status: :created, location: @fitness }
      else
        format.html { render action: "new" }
        format.json { render json: @fitness.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def fitness_params
  	params.require(:fitness).permit(:user_id, :activity)
  end
end
