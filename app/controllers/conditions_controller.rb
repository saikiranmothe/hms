class ConditionsController < ApplicationController
before_filter :authenticate_user!
 #before_filter :find_page, only: [:show, :new, :create]

  def index
    @user = User.find(params[:user_id])
    @conditions = @user.conditions

    if current_user.id == @user.id
			render action: :index
		else
			render file: 'public/denied'
		end
  end

  def show
    @page = Page.find(params[:page_id])
    @condition = Condition.find(params[:id])
    @user = @condition.user

   if current_user.id == @user.id
			render action: :show
		else
			render file: 'public/denied'
		end


  end

  def privacy
    @condition = Condition.find(params[:condition_id])
    @user = @condition.user
  end

  def new
     @page = Page.find(params[:page_id])
  	@condition = current_user.conditions.new

    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @condition }
    end
  end

  def destroy
  	@condition = Condition.find(params[:id])
  	@user = @condition.user
    @condition.destroy
    redirect_to user_conditions_path(@condition.user), :notice => "Successfully destroyed condition."
  end

  def create
    #@page = Page.find(params[:page_id])
    @condition = current_user.conditions.new( condition_params)

    respond_to do |format|
      if @condition.save
        format.html { redirect_to user_conditions_path(@condition.user), notice: 'Status was successfully created.' }
        format.json { render json: @condition, status: :created, location: @condition }
      else
        format.html { render action: "new" }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def condition_params
  	params.require(:condition).permit(:name, :description, :page_id)
  end

  #def find_page
  #  @page = Page.find(params[:page_id])
 # end
end
