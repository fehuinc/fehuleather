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
    resources :events,    only: [:index]
    resources :locations, only: [:index]
    resources :products,  only: [:index]
    resources :kingdoms,  only: [:index]
    resources :families,  only: [:index]
    resources :genuses,   only: [:index]
    resources :species,   only: [:index]
  end
  
  scope constraints: lambda { |request| request.session[:user].present? } do
    namespace :wholesale do
      resources :orders,    only: [:index]
    end
  end
  
  get 'stink' => 'stink#stink'
  post 'stinkin' => 'stink#stinkin'
  
  scope constraints: lambda { |request| request.session[:stinker] == ENV["STINKNAME"] } do
    namespace :admin do
      resources :events,    only: [:index, :update, :destroy]
      resources :locations, only: [:index, :update, :destroy]
      resources :orders,    only: [:index, :update, :destroy]
      resources :products,  only: [:index, :update, :destroy]
      resources :kingdoms,  only: [:index, :update, :destroy]
      resources :families,  only: [:index, :update, :destroy]
      resources :genuses,   only: [:index, :update, :destroy]
      resources :species,   only: [:index, :update, :destroy]
    end
    get 'stinkout' => 'stink#stinkout'
  end
  
  get 'err' => 'static#err'
  get '*slug' => 'static#err', format: false, as: "fake_err"

  
end
