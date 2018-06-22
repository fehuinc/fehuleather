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

    # Static — Admin
    get "stink" => "static#stink"
    post "stink" => "static#stink_in"
    delete "stink" => "static#stink_out"

    # Tips
    get "tips/double-wrap-belt" => redirect("tips/double-wrap-belt.pdf")

    # Wholesale — both
    get "wholesale/policies" => "wholesales#policies", as: :wholesale_policies
    get "merchant/logout" => "merchant#logout", as: "logout_merchant"
    get "order/:id/invoice" => "wholesales#invoice", as: :wholesale_order_invoice
    post "order/:id/pay" => "wholesales#pay", as: :wholesale_pay_invoice

    # Wholesale — public
    scope constraints: lambda { |request| request.session[:merchant_id].nil? || Merchant.find_by_id(request.session[:merchant_id]).nil? } do
      get "merchant" => "merchant#login"
      post "merchant" => "merchant#login_post"

      get "merchant/check-password" => "merchant#check_password"
      post "merchant/check-password" => "merchant#check_password_post"

      get "merchant/create-password" => "merchant#create_password"
      post "merchant/create-password" => "merchant#create_password_post"

      get "merchant/details" => "merchant#details"
      post "merchant/details" => "merchant#details_post"

      get "merchant/send-password-reset" => "merchant#send_password_reset"
      get "merchant/password-reset-sent" => "merchant#password_reset_sent"

      get "merchant/reset-password/:token" => "merchant#reset_password", as: :merchant_reset_password
      patch "merchant/reset-password/:token" => "merchant#reset_password_patch"

      get "merchant/*ignore" => redirect("merchant")
    end

    # Wholesale — private
    scope constraints: lambda { |request| !request.session[:merchant_id].nil? && !Merchant.find_by_id(request.session[:merchant_id]).nil? } do
      get "merchant" => "merchant#index"
      post "merchant" => "merchant#index"
      patch "merchant" => "merchant#update"

      namespace :merchant do
        resources :addresses, except: [:index, :show]
      end

      resource :wholesale, only: [:new, :edit] do
        root to: redirect("/merchant")
        get "product/:id" => "wholesales#edit_product", as: "product"
        patch "update_order/:build_id" => "wholesales#update_order"
        get "checkout" => "wholesales#checkout"
        post "submit" => "wholesales#submit"
        get "order/:id/received" => "wholesales#received", as: "received"
        get "orders" => "wholesales#index"
      end

      get "merchant/*ignore" => redirect("merchant")
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

        resources :orders, only: [:index]
        patch "orders/:id/mark-accepted" => "orders#accept", as: :order_mark_accepted
        patch "orders/:id/mark-paid" => "orders#paid", as: :order_mark_paid
        patch "orders/:id/mark-shipped" => "orders#ship", as: :order_mark_shipped

        get "wholesale" => "wholesale#index", as: "wholesale"
      end
    end

    get "*slug" => "static#not_found"
  end
end
