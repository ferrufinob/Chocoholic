Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#welcome"
  get "signup" => "users#new" #displays
  post "signup" => "users#create" #processes the login info
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users, only: [:show, :new, :create]

  resources :chocolates do
    resources :reviews, only: [:new, :create, :index]
  end

  resources :categories, only: [:index, :show] do
    resources :chocolates, only: [:show, :index]
  end
end
