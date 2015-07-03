Rails.application.routes.draw do
  root 'static#index'
  
  # Angular Pages
  get 'locations' => 'static#index'
  
  # Rails Pages
  get 'about' => 'static#about'
  
  get   '*slug' => 'static#err', format: false
  # get   '*slug' => 'static#index', format: false
end
