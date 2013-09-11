Ticketing::Application.routes.draw do
  

  devise_for :users, except: [:destroy]
  
  devise_for :users do 
  	delete '/users/sign_out' => 'devise/sessions#destroy' 
  end
  
	resources :users do
		 resources :events, only: [] do
		 	post :attend
		 	post :unattend
		 end
	end
 
  resources :events do
 		get :sessioned_show
  end
  root :to => 'events#index'

end
