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
        member do
          post 'play'
        end
      end

      post 'users/register_device_token' => 'users#register_device_token'
    end
  end

  resources :games
  resources :groups
  resources :users, only: :show do
    member do
      get "profile"
    end
  end

  root to: "home#index"
end
