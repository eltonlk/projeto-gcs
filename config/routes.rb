Rails.application.routes.draw do
  resources :tags
  devise_for :users

  resources :bank_accounts, except: [ :show ]

  root to: 'dashboard#index'
end
