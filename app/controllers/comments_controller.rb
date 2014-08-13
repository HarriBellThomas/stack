class CommentsController < ApplicationController

	before_action :find_story, only: [:new, :create, :destroy]

	def new
		#@story = Story.find(params[:story_id])
		@comment = @story.comments.new
	end


	def create 
		@comment = @story.comments.new(comment_params)
		if @comment.save
			flash[:success] = "Comment successfully submitted."
			redirect_to story_path(@story)
		else
			flash[:error] = "Comment not successfully created."
			render :new
		end
	end

	def destroy 

		@comment = Comment.find(params[:id])
		if @comment.destroy
			flash[:success] = "Comment deleted!"
		else
			flash[:error] = "Oops, there was an error."
		end
		redirect_to story_path(@comment.story)
	end



  	private
	def comment_params
		params.require(:comment).permit(:body)
  	end

  	def find_story
  		@story = Story.find(params[:story_id])
  	end

end
