class PicturesController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	#before_filter :finds_user
	before_filter :find_album
	#before_filter :find_picture, only: [:edit, :update, :show, :destroy]
	#before_filter :ensure_proper_user, only: [:edit, :new, :create, :update, :destroy]
	#before_filter :add_breadcrumbs


	def destroy
  		@picture = Picture.find(params[:id])
  		@user = @picture.user
    		@picture.destroy
    		redirect_to album_pictures_path(@picture.album), :notice => "Successfully destroyed picture."
  	end

	def show
		respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @picture }
	    end
	end

	def index
		@album = Album.find(params[:album_id])
		@pictures = @album.pictures.all
		@user = @album.user
	end

	def new
		@album = Album.find(params[:album_id])
		@picture = @album.pictures.new

	end

	def create
	    @picture = @album.pictures.new( picture_params)
	    
	    respond_to do |format|
	      if @picture.save
	        format.html { redirect_to album_pictures_path(@album), notice: 'Picture was successfully created.' }
	        format.json { render json: @picture, status: :created, location: @picture }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @picture.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private

	def picture_params
		params.require(:picture).permit(:user_id, :album_id, :caption, :description, :asset)
	end

	def ensure_proper_user
		if current_user != @user
			flash[:error] = "You don't have permission to do that."
			redirect_to album_pictures_path
		end
	end

	def find_album
		@album = Album.find(params[:album_id])
		#@user = User.find(@album.user_id)
		#@album = @user.albums.find(params[:album_id])
	end

	def find_picture
		@picture = @album.pictures.find(params[:id])
	end
end
