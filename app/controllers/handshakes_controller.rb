class HandshakesController < ApplicationController
	def create
		@user = User.find(params[:handshake][:followed_id])
		current_user.handshake!(@user)
		respond_to do |f|
			f.html { redirect_to users_path }
			f.js
		end
	end

	def show
		@handshake = Handshake.find(params[:id])
		@user = current_user

		respond_to do |format|
	        format.html # show.html.erb
	        format.json { render json: @handshake }
	    end
	end

	private

	def handshake_params
		params.require(:handshake).permit(:followed_id)
	end
end
