Rails.application.routes.draw do
  root "users#index"

  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"

  get "user", to: "users#index"
  put "user/deposit", to: "users#deposit", as: "user_deposit"
  put "user/send", to: "users#send_money", as: "user_send"
end
