Rails.application.routes.draw do
  
  
  # ANGULAR ###################################################
  root 'angular#index'
  get 'about' => 'angular#index'
  get 'events' => 'angular#index'
  get 'locations' => 'angular#index'
  
  
  # RAILS #####################################################
  get 'wholesale' => 'wholesale#landing'
  
  # Angular API endpoints
  namespace :api do
    resources :events
    resources :kingdoms
    resources :locations
    resources :products
  end
  
  scope constraints: lambda { |request| request.session[:user].present? } do
    namespace :wholesale do
      resources :orders
    end
  end
  
  get 'stink' => 'stink#stink'
  post 'stinkin' => 'stink#stinkin'
  
  #
  # I would like :create to POST to /resource/new, not /resource
  # That way, if there's a form error, we're still on the right page
  #
  
  scope constraints: lambda { |request| request.session[:stinker] == ENV["STINKNAME"] } do
    namespace :admin do
      root 'products#index'

      resources :events
      resources :locations
      resources :orders

      resources :kingdoms, except: [:show] do
        resources :products, only: [:new, :create]
      end
      resources :products, only: [:index, :edit, :update, :destroy] do
        resources :infos, only: [:new, :create]
        resources :variations, only: [:new, :create]
      end
      resources :infos, only: [:index, :edit, :update, :destroy]
      resources :variations, only: [:index, :edit, :update, :destroy] do
        resources :variants, only: [:new, :create]
      end
      resources :variants, only: [:index, :edit, :update, :destroy]
      
    end
    
    get 'stinkout' => 'stink#stinkout'
  end
  
  get 'err' => 'static#err'
  get '*slug' => 'static#err', format: false, as: "fake_err"
  
end
