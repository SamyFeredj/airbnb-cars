Rails.application.routes.draw do
  devise_for :users

  root to: "cars#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:index, :show, :update, :destroy] do
    collection do
      get :mycars
    end
    resources :reviews, only: [:create]
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check
end
