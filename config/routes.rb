Rails.application.routes.draw do
  resources :users
  post "users/login", to: "users#login"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  get "/", to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :todos
end
