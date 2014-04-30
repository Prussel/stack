class Story < ActiveRecord::Base

	# Add the neccessary associations for the comment system
	# my story has many comments

	has_many :comments 

	# my story has many votes
	has_many :votes


	# I want to check the data is what I expect. The model just handes the data.
	validates :title, presence: true,
		length: { minimum: 5 }

	validates :description, presence: true

	validates :link, presence: true, 
		uniqueness: { message: "has already been submitted" }


end
