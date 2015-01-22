class PostsController < ApplicationController
  before_filter :find_condition, only: [:index, :new, :create]

  # GET /posts
  # GET /posts.json
  def index
    @condition = Condition.find(params[:condition_id])
    @posts = @condition.posts.order("created_at DESC")
    @user = @condition.user

    if current_user.id == @user.id
      render action: :index
    else
      render file: 'public/denied'
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
  end

  # GET /posts/new
  def new
    @condition = Condition.find(params[:condition_id])
    @post = @condition.posts.new
    @user = @condition.user
  end

  # POST /posts
  # POST /posts.json
  def create
      @post = @condition.posts.new( post_params)
      
      respond_to do |format|
        if @post.save
          format.html { redirect_to condition_posts_path(@condition), notice: 'Post was successfully created.' }
          format.json { render json: @post, status: :created, location: @post }
        else
          format.html { render action: "new" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to condition_posts_path(@post.condition) }
      format.json { head :no_content }
    end
  end

  private
   
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:upload, :uplaod_file_name, :user_id, :title, :description)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_condition
    @condition = Condition.find(params[:condition_id])
    #@user = User.find(@album.user_id)
    #@album = @user.albums.find(params[:album_id])
  end

  def find_post
    @post = @condition.posts.find(params[:id])
  end
end
