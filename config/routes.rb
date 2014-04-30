Rails.application.routes.draw do
 

 # Active admin auto added these two lines
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

# Deleted all of the original comments so don't get confused between their comments and my own

# We want the ability to add, edit. delete stories
  # In rails, there are 7 default actions;
  # index, show
  # new, create
  # edit, update
  # destroy

  resources :stories do

    # added in a do and an end so that comments are related to stories do the URL's will be related too
    resources :comments

    # votes are also related to stories so add them in the same way
    resources :votes

  end

  # Set up a URL for the homepage. root is the way we say homepage in Rails
  root "stories#index"

end
