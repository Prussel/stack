class StoriesController < ApplicationController

	# We want to add a list of all of the stories
	# In static websites this would be the index.html

	def index

		# I want to pass some data to our html
		# this data may change, so it variable
		# so we store the data in a ruby thing called a variable
		@username = "Chris"


		# we want to store some stories in a list
		# in ruby we call this an array
		# [] create an array or list in rails
		# @stories = ["Google","Facebook","Twitter", "LinkedIn"]
	

		# instead of hard coding like the above, we want to get the real stories from the database
		# this is how we would just show all the stories with no order
		# @stories = Story.all

		if params[:featured] =="true"
			# this is just showing articles where featured is true
			@stories = Story.where(is_featured: true). order("created_at desc")

			# find jus the featured stories

		# this is showing the stories by the votes_count column in decening order, followed by the title in ascencing order
		# @stories = Story.order("votes_count desc, title asc")
		# elsif is used when we have more than 2 options so we need to have another option

		elsif params[:sort] == "recent"
			# sort by recent (note, sort above is just the word we made up in the URL in the application.html file)
			@stories = Story.order("created_at desc")

		else
		
			# sort by top

			@stories = Story.order("votes_count desc, title asc")
		end	 

	end

	def show
		# we have to call the view page the same as the name in the controller
		# defining the sort of read more page aka the product page
		# params get extra information from forms and URLs
		@story = Story.find(params[:id])


	end	

	def new
		# this is our new story form
		# this will try and find a html.erb page in View called new

		# the below creates a new variable called story which is equal to adding a new line in the story database
		@story = Story.new

		
	end

	def create
		# this is so that when the user hits submit it populates the database

		@story = Story.new(story_params)

		# adding in a check to see if the data that has been entered passed the validation in the model
		# added the if to the save to create the check. every if has an end.
		# save to the database
		if @story.save

			# let the user know that it was successful
			flash[:success] = "You're story was added successfully"

			# I want to go back to the homepage (bit could go to a thank you page instead...)
			redirect_to root_path

		# this is what happens if the data doesn't pass validation and save to the database 
		else

			# lets show the add a story form again to see if they want to try again
			render "new"

		end

	end	



	def edit
		# this is the form to edit the story
		@story = Story.find(params[:id])
	end	


	def update
		# the missing thing is update hence I need to use the update tag
		# first find the id for the story we are talking about
		@story = Story.find(params[:id])

		# update this story based on the form data
		if @story.update(story_params)

			# let the user know it worked

			flash[:success] = "You've edited the story!"

			# go back to the individual product page
			redirect_to story_path(@story)

		# adding an else so that if they try and edit to something already taken

		else 

			render "edit'" 

		end
	end	

	def destroy

		# actually delete the story from the database, first find it
		@story = Story.find(params[:id])

		# remove from the database
		@story.destroy

		# let them know it's been deleted

		flash[:success] = "Holy Moley! You've deleted this story."

		# send them to the homepage

		redirect_to root_path
	
	end	

	# this is creating a shortcut to find the data from the form
	def story_params
		
		# find the data from the form
		# making sure it is the story form and that it only has the title, description and link
		params.require(:story).permit(:title, :description, :link)
	end	



end









