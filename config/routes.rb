Rails.application.routes.draw do
  get 'drivers/index'
  resources :riders do
    resources :rides
  end
  resources :drivers
  resources :sessions, only: [:create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'
  
  get '/rider_login' => 'welcome#login_as_rider'
  get '/driver_login' => 'welcome#login_as_driver'
  
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
