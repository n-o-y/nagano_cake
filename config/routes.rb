Rails.application.routes.draw do
  namespace :admin do
    devise_for :admins, path: "", controllers: {
      sessions: "admin/admins/sessions"
    }
    get '/' => 'homes#top'
  end
end
