class TrackersController < ApplicationController
	before_filter :find_condition, only: [:index, :new, :create]

	def index
		@condition = Condition.find(params[:condition_id])
		@trackers = @condition.trackers.order("created_at DESC")
		@user = @condition.user

		if current_user.id == @user.id
			render action: :index
		else
			render file: 'public/denied'
		end
	end

	def show
		@tracker = Tracker.find(params[:id])
		@user = @tracker.condition.user
		respond_to do |format|
		format.html # show.html.erb
		format.json { render json: @tracker }
		end
	end

	# GET /trackers/new
	def new
		@condition = Condition.find(params[:condition_id])
		@tracker = @condition.trackers.new
		@user = @condition.user
	end

	# tracker /trackers
	# tracker /trackers.json
	def create
		@tracker = @condition.trackers.new( tracker_params)

		respond_to do |format|
		if @tracker.save
			format.html { redirect_to condition_trackers_path(@condition), notice: 'Treatment was successfully added.' }
			format.json { render json: @tracker, status: :created, location: @tracker }
		else
			format.html { render action: "new" }
			format.json { render json: @tracker.errors, status: :unprocessable_entity }
		end
		end
	end


	# DELETE /trackers/1
	# DELETE /trackers/1.json
	def destroy
		@tracker = Tracker.find(params[:id])
		@tracker.destroy
		respond_to do |format|
		format.html { redirect_to condition_trackers_path(@tracker.condition) }
		format.json { head :no_content }
		end
	end

	private

	# Never trust parameters from the scary internet, only allow the white list through.
	def tracker_params
		params.require(:tracker).permit(:user_id, :condition_id, :medication_id)
	end

	def find_condition
		@condition = Condition.find(params[:condition_id])
	end
end
