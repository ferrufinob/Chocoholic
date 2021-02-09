Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#welcome"
  get "signup" => "users#new" #displays
  post "signup" => "users#create" #processes the login info
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#google"
  resources :users, only: [:show, :new, :create]

  resources :reviews, only: [:index, :edit, :update, :destory]
  # resources :chocolates
  get "chocolates/most_popular" => "chocolates#most_popular"
  resources :chocolates do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :categories, only: [:index] do
    resources :chocolates, shallow: true
  end
end
