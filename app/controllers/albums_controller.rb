class AlbumsController < ApplicationController

	before_filter :authenticate_user!

	def show
		@album = Album.find(params[:id])
		@user = @album.user
		#redirect_to album_pictures_path(params[:id])
		respond_to do |format|
        		format.html # show.html.erb
       		format.json { render json: @album }
   		end
	end

	def index
		@user = User.find(params[:user_id])
		@albums = @user.albums.all
	end

	def new
		@user = User.find(params[:user_id])
		@album = current_user.albums.new
		respond_to do |format|
       		format.html # new.html.erb
       	 	format.json { render json: @album }
  	  	end
	end

	def create
		@album = current_user.albums.new( album_params)

		respond_to do |format|
			if @album.save
				format.html { redirect_to user_albums_path(@album.user), notice: 'Album was successfully created.' }
				format.json { render json: @album, status: :created, location: @album }
			else
				format.html { render action: "new" }
				format.json { render json: @album.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
  		@album = Album.find(params[:id])
  		@user = @album.user
    		@album.destroy
    		redirect_to user_albums_path(@album.user), :notice => "Successfully destroyed album."
  	end


	private

	def album_params
		params.require(:album).permit(:pictures, :user_id, :title, pictures_attributes: [:user_id, :album_id])
	end

	def ensure_proper_user
		if current_user != @user
			flash[:error] = "You don't have permission to do that."
			redirect_to user_albums_path(@user)
		end
	end


	def find_user
		@user = User.find(params[:user_id])
	end

	def find_albums
		@album = current_user.albums.find(params[:id])
	end
end
