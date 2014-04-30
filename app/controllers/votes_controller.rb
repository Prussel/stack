class VotesController < ApplicationController

	def create

		# actually creates the vote
		# find the story we are talking about. Using story id so it's the id outside of this controller, in the story controller

		@story = Story.find(params[:story_id])

		# make a new vote on this story
		@vote = @story.votes.new

		# as part of the vote, we want to prefill in the IP address of the user
		# the user shouldn't be able to fill this themselves, it should be automated
		@vote.ip_address = request.ip

		if @vote.save

			flash[:success]= "Thanks for the vote!"

		else

			# can pick any word where error is, doesn't mean anythign
			flash[:error]= "Woops! You've already voted..."

		end

			redirect_to story_path(@story)

	end	

end
