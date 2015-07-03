Rails.application.routes.draw do
  
  # Angular Pages
  root 'angular#index'
  get 'about' => 'angular#index'
  get 'events' => 'angular#index'
  get 'locations' => 'angular#index'
  
  # Rails Pages
  get 'wholesale' => 'wholesale#landing'
  get '*slug' => 'static#err', format: false
  
end
