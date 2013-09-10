Ticketing::Application.routes.draw do
  

  devise_for :users
  
  devise_for :users do 
  	get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  
 	resources :users do
 		 resources :events, only: [] do
 		 	post :attend
 		 	post :unattend
 		 end
  	end
 
  resources :events
  root :to => 'events#index'

end
