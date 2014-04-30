# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Story.create(title: "Google", description:"A search engine", 
	link: "http://www.google.com")

Story.create(title: "Facebook", description:"A social network", 
	link: "http://www.facebook.com")

Story.create(title: "Twitter", description:"140 characters only", 
	link: "http://www.twitter.com")