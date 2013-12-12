Versus::Application.routes.draw do
  resources :games

  resources :groups

  get "home/index"
  devise_for :users
  root to: "home#index"
end
