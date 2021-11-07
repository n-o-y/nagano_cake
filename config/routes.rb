Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'homes#top'
    devise_for :admins, path: "", controllers: {sessions: "admin/admins/sessions", registrations: "admin/admins/registrations"}
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :customers
    resources :orders,only: [:index, :show, :update]
    resources :order_details
  end
  scope module: :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    devise_for :customers, controllers: {sessions: "public/customers/sessions", registrations: "public/customers/registrations"}
    resource :customers, only: [:update] do
      collection do
        get 'my_page' => 'customers#show'
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :addresses, except: [:new, :show]
    resources :items, only: [:index, :show]
    resources :cart_items, except: [:show, :new, :edit] do
      collection do
        delete 'destroy_all' => 'cart_items#destroy_all'
      end
    end
    resources :orders, except: [:edit, :update, :destroy] do
      collection do
        post 'confirm' => "orders#confirm"
        get 'complete' => "orders#complete"
      end
    end
  end
end
