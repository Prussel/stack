class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|

    	#I want to add some columns to our database
    	#We want to save the title as a string (letters and numbers)
    	t.string :title
    	t.string :description
    	t.string :link

      t.timestamps
    end
  end
end
