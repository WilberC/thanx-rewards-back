Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      get "reward_redemptions/create"
      get "reward_redemptions/index"
      get "reward_catalog/index"
      get "reward_transactions/create"
      get "user_rewards/show"
      get "reward_tiers/index"
      resources :users
      post "login", to: "auth#login"
      resources :reward_tiers, only: [:index]
      resource :user_reward, only: [:show] # Singular since each user has only one reward record
      resources :reward_transactions, only: [:create]
      resources :reward_catalog, only: [:index]
      resources :reward_redemptions, only: [:create, :index]
    end
  end
end
