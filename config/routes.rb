Postfixman::Application.routes.draw do
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

  resources :client_accesses, except: [:show]
  resources :recipient_accesses, except: [:show]
  resources :sender_accesses, except: [:show]
  resources :workgroups, except: [:show]
end
