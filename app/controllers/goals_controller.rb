class GoalsController < ApplicationController
	def destroy
  		@goal = Goal.find(params[:id])
  		@user = @goal.user
    		@goal.destroy
    		redirect_to user_goals_path(@goal.user), :notice => "Successfully destroyed goal."
  	end

  	def mark_complete
  		@goal = Goal.find(params[:goal_id])
  		@goal.mark_completed
  		redirect_to goal_path(@goal)
  	end

  	def update

		@goal = Goal.find(params[:id])

		@goal.update_attributes(params.require(:foo).permit(:name))

		respond_to do |format|
			format.html { redirect_to goal_path(@goal), notice: 'Goal was successfully updated.' }
			format.json { head :no_content }
		end
  	end

  	def edit 
  		@goal = Goal.find(params[:id])
  		@user = @goal.user
  	end

	def show
		@goal = Goal.find(params[:id])
		@user = @goal.user


	     if current_user.id == @user.id
			render action: :show
		else
			render file: 'public/denied'
		end
	end

	def index
		@user = User.find(params[:user_id])
		@goals = @user.goals.all
		@unfinished_goals = @user.goals.get_unfinished
		@completed_goals = @user.goals.get_completed

		if current_user.id == @user.id
			render action: :index
		else
			render file: 'public/denied'
		end
	end

	def new
		@user = User.find(params[:user_id])
		@goal = @user.goals.new

	end

	def create
		@user = User.find(params[:user_id])
	    @goal = @user.goals.new( goal_params)
	    
	    respond_to do |format|
	      if @goal.save
	        format.html { redirect_to user_goals_path(@user), notice: 'Goal was successfully created.' }
	        format.json { render json: @goal, status: :created, location: @goal }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @goal.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private

	def goal_params
		params.require(:goal).permit(:completed, :user_id, :name, :number_name, :use_number, :use_photo, :use_words, :number_goal, :use_goal_date, :goal_date, :text, :category)
	end
end
