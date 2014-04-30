class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

    	# I want to link the comments table in the DB with a story. use the _id function
    	t.integer :story_id

    	# adding in our comment
    	# we want to save the comment as a paragraph as it is saved differently - we use text instead of string
    	t.text :body

      t.timestamps
    end
  end
end
