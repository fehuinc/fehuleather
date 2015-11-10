Rails.application.routes.draw do
  scope format: false do
    
    # Need to reimplement these
    # get "checkout" => "angular#index"
    # get "payment" => "angular#index"
    
    # Static
    root "static#home"
    get "about" => "static#about"
    get "events" => "static#events"
    get "locations" => "static#locations"
    
    # Angular API endpoints
    namespace :api do
      get "totem" => "totem#index"
    end
    
    # Wholesale — either logged in or not
    get "logout" => "merchants#logout", as: "logout_merchant"
    
    # Wholesale — not logged in
    scope constraints: lambda { |request| request.session[:merchant_id].nil? || Merchant.find_by_id(request.session[:merchant_id]).nil? } do
      get "wholesale" => "wholesale#login"
      post "wholesale" => "wholesale#login"
      get "merchant" => "merchants#new", as: "new_merchant"
      post "merchant" => "merchants#create"
    end
    
    # Wholesale — logged in
    scope constraints: lambda { |request| !request.session[:merchant_id].nil? && !Merchant.find_by_id(request.session[:merchant_id]).nil? } do
      get "wholesale" => "wholesale#index"
      post "wholesale" => "wholesale#index"
      get "merchant" => "merchants#edit", as: "edit_merchant"
      patch "merchant" => "merchants#update"
      namespace :wholesale do
        resource :order, only: [:new, :edit, :update] do
          get "product/:id" => "orders#edit_product", as: "product"
          patch "product/:id" => "orders#update_product"
          get "checkout" => "orders#checkout"
        end
      end
    end
    
    
    # Admin
    get "stink" => "stink#stink"
    post "stink" => "stink#stink_in"
    delete "stink" => "stink#stink_out"
    
    scope constraints: lambda { |request| request.session[:stinker] == ENV["STINKNAME"] } do
      namespace :admin do
        root "kingdoms#index"
        
        get "preview-images/:id" => "products#preview_images", as: "preview_images"
        
        put "configuration/:id" => "products#update_configuration", as: "update_configuration"
        
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
    
    # Errors
    get "err" => "static#err"
    get "*slug" => "static#err", as: "fake_err"
    
  end
end
