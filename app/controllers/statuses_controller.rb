class StatusesController < ApplicationController
	before_filter :authenticate_user!


	def show
		@status = Status.find(params[:id])

		respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @status }
	 end
	end

	def create
		@status = current_user.statuses.new( status_params)

		respond_to do |format|
			if @status.save
				format.html { redirect_to @status, notice: 'Status was successfully created.' }
				format.json { render json: @status, status: :created, location: @status }
			else
				format.html { render action: "new" }
				format.json { render json: @status.errors, status: :unprocessable_entity }
			end
		end
	end

	def new
		@user = current_user
		@status = current_user.statuses.new
		@status.build_document

		respond_to do |format|
	     	format.html # new.html.erb
	     	format.json { render json: @status }
		end
	end

	private

	def status_params
		params.require(:status).permit(:content, :user_id, :document_attributes, document_attributes: [ :attachment ])
	end
end
