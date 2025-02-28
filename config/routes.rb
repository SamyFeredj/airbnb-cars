Rails.application.routes.draw do
  devise_for :users
  resources :cars, only: [:index, :show, :new, :create]
  root to: "cars#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
