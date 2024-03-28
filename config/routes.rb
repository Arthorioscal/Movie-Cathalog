Rails.application.routes.draw do
  root "home#index"
  get "genres/index", to: "genres#index"
  get "directors/index", to: "directors#index"
  get "movies/index", to: "movies#index"
  resources :genres, only: [:show, :new, :create, :edit, :update]
  resources :movies, only: [:show, :new, :create, :edit, :update]
  resources :directors, only: [:show, :new, :create, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
