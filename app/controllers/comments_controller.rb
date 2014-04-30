class CommentsController < ApplicationController

	def new
		# this is the comment form

		# find the story that the new comment will be on
		# because we're in the comments controller we need to include story_ before id to make sure it knows it the story, not the comment ID
		@story = Story.find(params[:story_id])

		# make a new comment on the @story variable
		# the @ bit is creating a variable
		@comment = @story.comments.new

	end
	
	def create

		# this is actually creating the comment

		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		# if the comment saves correctly, go back to story page, if not, show new form again

		if @comment.save

			flash[:success] = "Your comment was added successfully!"

			redirect_to story_path(@story)

		else
		
			render "new"


		end	

	end

	def comment_params

		# whitelisted form data
		# get the comments form and only the body of the form
		params.require(:comment).permit(:body)

	end	

end
