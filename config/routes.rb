Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/sapphire', as: 'rails_admin'
  # resources :questions
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
 
  root "pages#home"
  get '/scoreboard' => 'pages#scoreboard'
  get '/error' => 'pages#error'
  post '/abdv' => 'pages#abdv'
  
  resources :users, only: [:edit, :update]

end
