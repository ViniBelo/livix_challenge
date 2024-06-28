Rails.application.routes.draw do
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
end
