Rails.application.routes.draw do
  root to: 'domains#index'

  resources :sessions, only: [:create]

  get :login, to: 'sessions#new', as: :login
  get :logout, to: 'sessions#destroy', as: :logout

  resources :domains, shallow: true do
    resources :users, except: [:index, :show]
    resources :aliases, except: [:index]
    resources :recipient_bccs, except: [:index, :show]
    resources :sender_bccs, except: [:index, :show]
  end

  resources :api_clients, except: [:show]
  resources :client_accesses, except: [:show]
  resources :recipient_accesses, except: [:show]
  resources :sender_accesses, except: [:show]
  resources :workgroups, except: [:show]

  namespace :api, defaults: { format: :json } do
    resources :domains, only: [:index, :show] do
      member do
        get :users
        get :aliases
        get :recipient_bccs
        get :sender_bccs
      end
    end

    resources :users, only: [:show, :create, :update, :destroy]
    resources :aliases, only: [:show, :create, :update, :destroy]
    resources :recipient_bccs, only: [:show, :create, :update, :destroy]
    resources :sender_bccs, only: [:show, :create, :update, :destroy]
  end
end
