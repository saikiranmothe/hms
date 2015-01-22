class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Added friend."
			redirect_to users_path
		else
			flash[:error] = "unable to add friend."
			redirect_to users_path
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		flash[:notice] = "Removed friendship."
		redirect_to current_user
	end

	private

	def user_friendship_params
		params.require(:user_friendship).permit(:user, :friend, :user_id, :friend_id, :state, :friend_params[:email] )
	end
end
