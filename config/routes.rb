Rails.application.routes.draw do
  get "tracking/show"
  namespace :admin do
    root to: "dashboard#index"
    resources :orders, only: [:index, :update, :show] do
      resources :tracking_updates, only: [:create], module: :orders
    end
    resources :users, only: [:index, :show]
  end

  authenticate :user do
    get "dashboard", to: "dashboard#index"
    namespace :dashboard do
      resources :orders, only: [:index, :new, :create, :show]
      get "my_packages", to: "orders#index"
      get "warehouse"
      resources :addresses
      get "profile"
    end
  end
  resources :tracking, only: [:show], param: :tracking_number
  get "track", to: "tracking#show", as: :track
  post "track", to: "tracking#show" # 支持 POST 提交表单
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
