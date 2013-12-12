Versus::Application.routes.draw do
  devise_for :users

  resources :games
  resources :groups
  resources :users, only: :none do
    member do
      get "profile"
    end
  end

  root to: "home#index"
end
