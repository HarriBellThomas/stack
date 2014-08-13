class StoriesController < ApplicationController

	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		if params[:sort] == "popular"
			@stories = Story.all.order('votes_count DESC')
		elsif params[:sort] == "featured" 
			@stories = Story.where(is_featured: true)
		else
			@stories = Story.all.order('created_at DESC')
		end
	end #index method end


	def show
		#@story = Story.find( params[:id] )
	end 


	def new
		@story = Story.new
	end


	def create 
		@story = Story.new(story_params)
		if @story.save
			flash[:success] = "Thank you for submitting a story."
			redirect_to root_path
		else
			flash[:error] = "Oops, something went wrong."
			render :new
		end
	end


	def destroy
		#@story = Story.find( params[:id] )
		if @story.present?
			if @story.destroy
				flash[:success] = "Successfully deleted '#{@story.title}'"
			else
				flash[:error] = "Story found, but couldn't be deleted."
			end
		else
			flash[:error] = "No story found with ID #{params[:id]} "
		end
		redirect_to root_path
	end


	def edit
		#@story = Story.find( params[:id] )
	end


	def update
		#@story = Story.find( params[:id] )
		if @story.update(story_params)
			flash[:success] = "Updated successfully."
			redirect_to story_path(@story)
		else
			flash[:error] = "Update failed."
			render :edit
		end
	end









	private 
	def story_params
		params.require(:story).permit(:title, :url, :description)
	end

	def find_story
		@story = Story.find( params[:id] )
	end


end