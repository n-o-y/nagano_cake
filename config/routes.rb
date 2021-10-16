Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'homes#top'
    devise_for :admins, path: "", controllers: {
      sessions: "admin/admins/sessions"
    }
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update]
  end
end
