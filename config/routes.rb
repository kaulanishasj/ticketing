Ticketing::Application.routes.draw do
  

  devise_for :users
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  resource :users

  resources :events 
  
  root :to => 'events#index'

end
