Rails.application.routes.draw do
  get 'admins/index'
  get 'admin/index'
  get 'drivers/index'
  resources :riders
  resources :drivers do
    resources :certifications do 
      get 'approve', :on => :member
      get 'reject', :on => :member
    end
  end
  resources :admins
  resources :sessions, only: [:create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'
  
  get '/rider_login' => 'welcome#login_as_rider'
  get '/driver_login' => 'welcome#login_as_driver'
  get '/admin_login' => 'welcome#login_as_admin'
  
  get '/certifications', to: 'certifications#index'
  
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
