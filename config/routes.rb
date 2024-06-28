Rails.application.routes.draw do
  root "registrations#new"

  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
end
