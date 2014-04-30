class Vote < ActiveRecord::Base

	# add an association

	belongs_to :story, counter_cache:true

end
