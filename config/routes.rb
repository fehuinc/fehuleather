Rails.application.routes.draw do
  
  # Angular Pages
  root 'angular#index'
  get 'about' => 'angular#index'
  get 'events' => 'angular#index'
  get 'locations' => 'angular#index'
  
  # Rails Pages
  get 'wholesale' => 'wholesale#landing'
  
  get 'stink' => 'stink#stink'
  post 'stinkin' => 'stink#stinkin'

  scope constraints: lambda { |request| request.session[:stinker] == ENV["STINKNAME"] } do
    namespace :admin do
      resources :events
      resources :locations
      resources :orders
      resources :products
    end
    get 'stinkout' => 'stink#stinkout'
  end
  
  get 'err' => 'static#err'
  get '*slug' => 'static#err', format: false, as: "fake_err"
  
end
