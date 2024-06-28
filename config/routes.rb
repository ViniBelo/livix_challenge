Rails.application.routes.draw do
  get "signup", to: "registrations#new"
  post "users", to: "registrations#create"
end
