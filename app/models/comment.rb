class Comment < ActiveRecord::Base

	# adding in an association between the comment and the story
	# my comment belongs to a story

	# we added the comma after story to tell it to update story when a new comment is created

	belongs_to :story, counter_cache: true


	# add validations
	validates :body, presence: true 


end
