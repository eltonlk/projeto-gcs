Rails.application.routes.draw do
  devise_for :users

  resources :bank_accounts, except: [ :show ] do
    get 'delete', on: :member
  end

  resources :operations, except: [ :show ]

  resources :tags, except: [ :show ]

  root to: 'dashboard#index'
end
