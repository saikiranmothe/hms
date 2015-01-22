class PermissionsController < ApplicationController
before_filter :authenticate_user!
 #before_filter :find_page, only: [:show, :new, :create]

  def index
    @user = User.find(params[:user_id])
    @permissions = @user.permissions

    if current_user.id == @user.id
			render action: :index
		else
			render file: 'public/denied'
		end
  end

  def show
    @permission = Permission.find(params[:id])
    @user = @permission.user

   if current_user.id == @user.id
			render action: :show
		else
			render file: 'public/denied'
		end


  end

  def new
    @user = User.find(params[:user_id])
  	@permission = user.permissions.new

    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @permission }
    end
  end

  def destroy
  	@permission = Permission.find(params[:id])
  	@user = @permission.user
    @permission.destroy
    redirect_to user_network_path(@permission.user), :notice => "Successfully destroyed permission."
  end

  def create
    #@page = Page.find(params[:page_id])
    @permission = current_user.permissions.new( permission_params)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to user_network_path(@permission.user), notice: 'Status was successfully created.' }
        format.json { render json: @permission, status: :created, location: @permission }
      else
        format.html { render action: "new" }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def permission_params
    params.require(:permission).permit(:user_id, :permissible_user_id, :condition_id, :goal_id)
  end
end
