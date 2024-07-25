Rails.application.routes.draw do
  root 'users#index'

  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    resources :user_details
  end
  put 'funds/deposit', to: 'users#deposit', as: 'funds_deposit'
  put 'funds/send', to: 'users#send_money', as: 'funds_send'
end
