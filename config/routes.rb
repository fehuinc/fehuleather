Rails.application.routes.draw do
  root 'static#index'
  
  # Angular Pages
  get 'about' => 'static#index'
  get 'events' => 'static#index'
  get 'locations' => 'static#index'
  
  # Rails Pages
  get 'wholesale' => 'wholesale#landing'
  
  get   '*slug' => 'static#err', format: false
end
