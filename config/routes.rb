Rails.application.routes.draw do
  root 'static#index'
  
  get   '*slug' => 'static#index', format: false
end
