class PagesController < ApplicationController
	def index
		@pages = Page.all
	end

	def show
		@page = Page.find(params[:id])
		@user = @page.user
		#@conditions = @page.conditions

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @page }
		end
	end

	def edit
		@page = Page.find(params[:id])
		@user = @page.user
		#@conditions = @page.conditions

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @page }
		end
	end

	def update
		@page = Page.find(params[:id])
		respond_to do |format|
	      if @page.update(page_params)
	        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @page.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def new
		@page = Page.new

		respond_to do |format|
	    	format.html # new.html.erb
	    	format.json { render json: @page }
		end
	end

	def destroy
		@page = page.find(params[:id])
		@page.destroy
		redirect_to pages_path, :notice => "Successfully destroyed page."
	end

	def create
		@page = Page.new( page_params)

		respond_to do |format|
			if @page.save
				format.html { redirect_to pages_path, notice: 'Success!' }
				format.json { render json: @page, status: :created, location: @page }
			else
				format.html { render action: "new" }
				format.json { render json: @page.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def page_params
		params.require(:page).permit(:name, :description, :page_type)
	end
end	