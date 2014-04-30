class VotesController < ApplicationController

	def create

		# actually creates the vote
		# find the story we are talking about. Using story id so it's the id outside of this controller, in the story controller

		@story = Story.find(params[:story_id])

		# make a new vote on this story
		@vote = @story.votes.new

		@vote.save

		flash[:success]= "Thanks for the vote!"

		redirect_to story_path(@story)

	end	

end
