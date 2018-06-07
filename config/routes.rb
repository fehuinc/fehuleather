Rails.application.routes.draw do
  scope format: false do
    # MUST COME FIRST: Redirect apex requests to www
    match '(*any)', via: :all, constraints: { subdomain: '' }, to: redirect { |_, req| req.url.sub '//', '//www.' }

    # Retail
    root "totem#index"
    get "checkout" => "static#checkout"
    get "payment" => "static#payment"
    get "order-complete/:id" => "retail_orders#order_complete", as: "order_complete"
    resources :orders, only: [:create, :show], controller: "retail_orders"

    # Static
    get "about" => "static#about"
    get "events" => "static#events"
    get "locations" => "static#locations"
    get "press" => "static#press"
    get "catalog" => "static#catalog"
    get "robots.txt" => "static#robots"
    # Static — Admin
    get "stink" => "static#stink"
    post "stink" => "static#stink_in"
    delete "stink" => "static#stink_out"

    # Tips
    get "tips/double-wrap-belt" => redirect("tips/double-wrap-belt.pdf")

    # Wholesale
    if FeatureFlags.check :wholesale
      get "logout" => "merchant#logout", as: "logout_merchant"
    end

    # Wholesale — public
    scope constraints: lambda { |request| request.session[:merchant_id].nil? || Merchant.find_by_id(request.session[:merchant_id]).nil? } do
      if FeatureFlags.check :wholesale
        get "merchant/new" => "merchant#new", as: "new_merchant"
        post "merchant/new" => "merchant#create", as: nil
        post "merchant" => "merchant#login"
      end
      get "merchant" => "merchant#login"
      get "merchant/*ignore" => "merchant#login"
    end

    # Wholesale — private
    if FeatureFlags.check :wholesale
      scope constraints: lambda { |request| !request.session[:merchant_id].nil? && !Merchant.find_by_id(request.session[:merchant_id]).nil? } do
        get "merchant" => "merchant#index"
        post "merchant" => "merchant#index"
        patch "merchant" => "merchant#update"

        namespace :merchant do
          resources :addresses, except: [:index, :show]
        end

        resource :wholesale, only: [:new, :edit] do
          get "product/:id" => "wholesales#edit_product", as: "product"
          patch "update_order/:build_id" => "wholesales#update_order"
          get "checkout" => "wholesales#checkout"
          post "submit" => "wholesales#submit"
          post "submit-cc" => "wholesales#submit_cc"
          get "order/:id" => "wholesales#show", as: "show"
          get "orders" => "wholesales#index"
        end
      end
    end

    # Admin
    scope constraints: lambda { |request| request.session[:stinker] == ENV.fetch("STINKNAME") } do
      namespace :admin do
        put "builds/:id" => "builds#ajax_update"

        get "totem" => "totem_rows#index", as: "totem"
        resources :totem_rows, except: [:index] do
          resources :totem_items, shallow: true
        end

        resources :products, except: [:show] do
          resources :variations, only: [:new, :create]
          resources :sizes, only: [:new, :create]
        end
        resources :variations, only: [:edit, :update, :destroy] do
          resources :builds, only: [:new, :create]
        end
        resources :builds, only: [:edit, :update, :destroy]
        resources :sizes, only: [:edit, :update, :destroy]
        resources :events, except: [:show]
        resources :locations, except: [:show]
        resources :orders, except: [:show]
        get "wholesale" => "wholesale#index", as: "wholesale"
      end
    end

    get "*slug" => "static#not_found"
  end
end
