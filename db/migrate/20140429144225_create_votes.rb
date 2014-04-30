class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

    	# store which story we are talking about and the IP address of the user
    	t.integer :story_id
    	t.string :ip_address

      t.timestamps
    end
  end
end
