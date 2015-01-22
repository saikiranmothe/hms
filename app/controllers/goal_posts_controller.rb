class GoalPostsController < ApplicationController
	def destroy
  		@goal_post = GoalPost.find(params[:id])
  		@user = @goal_post.goal.user
    		@goal_post.destroy
    		redirect_to goal_path(@goal_post.goal), :notice => "Successfully destroyed goal_post."
  	end

	def show
		@goal_post = GoalPost.find(params[:id])
		@user = @goal_post.goal.user
		@goal = @goal_post.goal
		respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @goal_post }
	    end
	end

	def index
		@goal = Goal.find(params[:goal_id])
		@goal_posts = @goal.goal_posts.all
		@user = @goal.user
	end

	def new
		@goal = Goal.find(params[:goal_id])
		@goal_post = @goal.goal_posts.new

	end

	def create
		@goal = Goal.find(params[:goal_id])
	    	@goal_post = @goal.goal_posts.new( goal_post_params)
	    
	    respond_to do |format|
	      if @goal_post.save
	        format.html { redirect_to goal_path(@goal), notice: 'Progress was successfully updated.' }
	        format.json { render json: @goal_post, status: :created, location: @goal_post }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @goal_post.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private

	def goal_post_params
		params.require(:goal_post).permit(:user_id, :goal_id, :words, :number, :photo)
	end
end
