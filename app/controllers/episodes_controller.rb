class EpisodesController < ApplicationController
	before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @episodes = @user.episodes
  end

  def show
    @episode = Episode.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @episode }
   end
  end

  def new
  	@episode = current_user.episodes.new

    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @episode }
    end
  end

  def destroy
  	@episode = Episode.find(params[:id])
  	@user = @episode.user
    @episode.destroy
    redirect_to user_episodes_path(@episode.user), :notice => "Successfully destroyed episode."
  end

  def create
   @episode = current_user.episodes.new( episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to user_episodes_path(@episode.user), notice: 'Status was successfully created.' }
        format.json { render json: @episode, status: :created, location: @episode }
      else
        format.html { render action: "new" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def episode_params
  	params.require(:episode).permit(:user_id, :name, :description)
  end
end
