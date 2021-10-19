Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'homes#top'
    devise_for :admins, path: "", controllers: {sessions: "admin/admins/sessions"}
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :customers
    resources :orders
    resources :order_details
  end
end
