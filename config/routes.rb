Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "stories#index"
  resources :stories do #symbol
    resources :comments
    resources :votes
  end



  #  NOTES

  #hash = { story_1: "Story 1", story_2: "Story 2", story_3: { story_3_1: "3 pt 1" } }
  #hash[:story_2] <= outputs "Story 2"
  #hash[:story_3][:story_3_1] <= outputs "3 pt 1"

  # bool ops. and, or, if, else

  #if hash[:story_1]
  	#puts hash[:story_1]
  #else
  	#puts "Sorry, no story_1"
  #end 

end