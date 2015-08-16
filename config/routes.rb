Rails.application.routes.draw do
  
  scope format: false do
    # ANGULAR ###################################################
    root 'angular#index'
    get 'about' => 'angular#index'
    get 'events' => 'angular#index'
    get 'locations' => 'angular#index'
    
    
    # RAILS #####################################################
    get 'wholesale' => 'wholesale#landing'
    
    # Angular API endpoints
    namespace :api do
    #   resources :events
    #   resources :locations
      get 'totem' => 'totem#index'
    end
    
    # scope constraints: lambda { |request| request.session[:user].present? } do
    #   namespace :wholesale do
    #     resources :orders
    #   end
    # end
    
    get 'stink' => 'stink#stink'
    post 'stink' => 'stink#stink_in'
    delete 'stink' => 'stink#stink_out'
    
    scope constraints: lambda { |request| request.session[:stinker] == ENV["STINKNAME"] } do
      namespace :admin do
        root 'kingdoms#index'
        
        get 'preview-images/:id' => 'products#preview_images', as: "preview_images"
        
        put 'stock/:id' => 'products#update_stock', as: "update_stock"
        
        resources :kingdoms, except: [:show] do
          resources :products, only: [:new, :create]
        end
        resources :products, only: [:edit, :update, :destroy] do
          resources :infos, only: [:new, :create]
          resources :variations, only: [:new, :create]
        end
        resources :infos, only: [:edit, :update, :destroy]
        resources :variations, only: [:edit, :update, :destroy] do
          resources :variants, only: [:new, :create]
        end
        resources :variants, only: [:edit, :update, :destroy]

        resources :events, only: [:index]
        resources :locations, only: [:index]
        resources :orders, only: [:index]
      end
    end
    
    get 'err' => 'static#err'
    get '*slug' => 'static#err', format: false, as: "fake_err"
    
  end
end
