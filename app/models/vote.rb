class Vote < ActiveRecord::Base

	# add an association

	belongs_to :story, counter_cache:true

	# adding in a validation to ensure that the votes on stories can't be voted for multiple times
	# we could use true but the {} allow us to use options
	validates :ip_address, uniqueness: { scope: :story_id}

end
