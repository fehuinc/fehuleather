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
  
  scope constraints: lambda { |request| request.session[:stinker] == ENV["STINKNAME"] } do
    namespace :admin do
      resources :events
      resources :kingdoms
      resources :locations
      resources :orders
      resources :products
    end
    get 'stinkout' => 'stink#stinkout'
  end
  
  get 'err' => 'static#err'
  get '*slug' => 'static#err', format: false, as: "fake_err"
  
end
