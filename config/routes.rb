Rails.application.routes.draw do
  devise_for :users,
    controllers: {
    registrations: "users/registrations",
    session: "users/sessions",
    # omniauth_callbacks: "users/omniauth_callbacks" # This controller manages the authentication flow when users sign in using external providers like Google, Facebook, etc.
  }

  resources :tweets, only: [:index, :create, :show] do
    resources :likes, only: [:create, :destroy]
    resources :retweets, only: [:create, :destroy]
    resources :twitter_views, only: [:create]
    resources :bookmarks, only: [:create, :destroy]
    resources :replies, only: [:create]
  end
  resource :onboarding, only: [:new, :update]

  get :profile, to: "profile#show"
  put :profile, to: "profile#update"

  get :likes, to: "likes#index"
  get :retweets, to: "retweets#index"
  get :bookmarks, to: "bookmarks#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "tweets#index"
end
