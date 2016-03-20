Rails.application.routes.draw do
  scope format: false do
    # MUST COME FIRST: Redirect apex requests to www
    match '(*any)', via: :all, constraints: { subdomain: '' }, to: redirect { |_, req| req.url.sub '//', '//www.' }

    # Retail
    root "static#totem"
    get "checkout" => "static#checkout"
    get "payment" => "static#payment"
    get "confirmation" => "static#confirmation"
    resources "retail_orders", only: [:create, :show]
    
    # Static
    get "about" => "static#about"
    get "events" => "static#events"
    get "locations" => "static#locations"
    get "press" => "static#press"
    get "catalog" => "static#catalog"

    # Legacy routes
    get "/pages/story" => redirect("/about")
    get "/pages/events" => redirect("/events")
    get "/pages/locations" => redirect("/locations")
    get "/pages/press-kit" => redirect("/press")
    get "/pages/wholesale" => redirect("/merchant")
    get "/products/*ignore" => redirect("/")
    get "/collections/*ignore" => redirect("/")

    # Wholesale
    get "logout" => "merchants#logout", as: "logout_merchant"
    
    # Wholesale — public
    scope constraints: lambda { |request| request.session[:merchant_id].nil? || Merchant.find_by_id(request.session[:merchant_id]).nil? } do
      resource :merchant, only: [:new]
      post "merchant/new" => "merchants#create", as: nil
      get "merchant" => "merchants#login"
      post "merchant" => "merchants#login"
      get "merchant/*ignore" => "merchants#login"
    end
    
    # Wholesale — private
    scope constraints: lambda { |request| !request.session[:merchant_id].nil? && !Merchant.find_by_id(request.session[:merchant_id]).nil? } do
      get "merchant" => "merchants#index"
      post "merchant" => "merchants#index"
      get "merchant/edit" => "merchants#edit"
      patch "merchant/edit" => "merchants#update"
      
      resource :wholesale, only: [:new, :edit] do
        get "product/:id" => "wholesales#edit_product", as: "product"
        patch "update_order/:build_id" => "wholesales#update_order"
        get "checkout" => "wholesales#checkout"
      end
    end
    
    
    # Admin
    get "stink" => "stink#stink"
    post "stink" => "stink#stink_in"
    delete "stink" => "stink#stink_out"
    
    scope constraints: lambda { |request| request.session[:stinker] == ENV["STINKNAME"] } do
      namespace :admin do
        root "kingdoms#index"
        put "build/:id" => "products#update_build", as: "update_build"
        
        get "totem" => "totem_rows#index", as: "totem"
        resources :totem_rows, except: [:index] do
          resources :totem_items, shallow: true
        end
        
        resources :kingdoms, except: [:show] do
          resources :products, only: [:new, :create]
        end
        resources :products, only: [:edit, :update, :destroy] do
          resources :product_infos, only: [:new, :create]
          resources :variations, only: [:new, :create]
          resources :sizes, only: [:new, :create]
        end
        resources :variations, only: [:edit, :update, :destroy] do
          resources :builds, only: [:new, :create]
        end
        resources :builds, only: [:edit, :update, :destroy]
        resources :sizes, only: [:edit, :update, :destroy]
        resources :product_infos, only: [:edit, :update, :destroy]
        resources :events, except: [:show]
        resources :locations, except: [:show]
        resources :orders, except: [:show]
      end
    end
    
    get "*slug" => "static#not_found"
  end
end
