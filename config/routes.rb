Versus::Application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :games
      resources :members, :only => :index do
        collection do
          get 'suggest'
        end
      end
    end
  end

  resources :games
  resources :groups
  resources :users, only: :none do
    member do
      get "profile"
    end
  end

  root to: "home#index"
end
